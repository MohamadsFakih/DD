import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:digital_defender/features/post_share/data/model/post_params.dart';
import 'package:digital_defender/features/quick_reply/data/models/reply_params.dart';
import 'package:digital_defender/features/quick_reply/domain/usecase/reply_usecase.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'reply_event.dart';
part 'reply_state.dart';
part 'reply_bloc.freezed.dart';

@injectable
class ReplyBloc extends Bloc<ReplyEvent, ReplyState> {
  ReplyBloc(this._replyUseCase) : super(const ReplyState.initial()) {
    on<ReplyEvent>((event, emit) async {
      await event.when(
        quickReply: (ReplyParams params) => _quickReply(params, emit),
      );
    });
  }
  final ReplyUseCase _replyUseCase;

  Future _quickReply(ReplyParams params, Emitter<ReplyState> emit) async {
    emit(
      state.copyWith(
        isLoading: true,
      ),
    );
    final res = await _replyUseCase.quickReply(params);

    res.fold((error) => emit(state), (response) {
      emit(
        state.copyWith(
          postResponse: response,
        ),
      );
    });
    emit(
      state.copyWith(
        isLoading: false,
      ),
    );
  }
}
