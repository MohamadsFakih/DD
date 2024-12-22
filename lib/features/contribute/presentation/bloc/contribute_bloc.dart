import 'package:bloc/bloc.dart';
import 'package:digital_defender/core/utils/constants/app_constants.dart';
import 'package:digital_defender/core/utils/constants/constant_functions.dart';
import 'package:digital_defender/features/contribute/data/models/send_content_params.dart';
import 'package:digital_defender/features/contribute/domain/usecase/contribute_usecase.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'contribute_event.dart';
part 'contribute_state.dart';
part 'contribute_bloc.freezed.dart';

@injectable
class ContributeBloc extends Bloc<ContributeEvent, ContributeState> {
  ContributeBloc(this._useCase) : super(const ContributeState.initial()) {
    on<ContributeEvent>((event, emit) async {
      await event.when(
          submitContent: (SendContentParams params) =>
              _submitContent(params, emit));
    });
  }
  final ContributeUseCase _useCase;
  Future _submitContent(
      SendContentParams params, Emitter<ContributeState> emit) async {
    emit(
      state.copyWith(isLoading: true),
    );
    final res = await _useCase.submitPost(params);
    res.fold(
      (error) {
        showTopSnackbar(
          title: "Error",
          message: "Something went wrong, please try again",
        );
        logger.d(error);
      },
      (response) {
        // emit(
        //   state.copyWith(
        //     loginResponse: response,
        //   ),
        // );
      },
    );
    emit(
      state.copyWith(isLoading: false),
    );
  }
}
