import 'package:digital_defender/features/post_share/data/model/get_video_params.dart';
import 'package:digital_defender/features/post_share/data/model/get_video_response.dart';
import 'package:digital_defender/features/post_share/domain/usecase/post_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:digital_defender/features/post_share/data/model/post_params.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'post_event.dart';
part 'post_state.dart';
part 'post_bloc.freezed.dart';

@injectable
class PostBloc extends Bloc<PostEvent, PostState> {
  PostBloc(this._postUseCase) : super(const PostState.initial()) {
    on<PostEvent>((event, emit) async {
      await event.when(
          postVideo: (String link) => _postVideo(link, emit),
          getVideo: (GetVideoParams params) => _getVideo(params, emit));
    });
  }
  final PostUseCase _postUseCase;
  _postVideo(String link, Emitter<PostState> emit) async {
    emit(
      state.copyWith(
        isLoading: true,
      ),
    );
    final res = await _postUseCase.postShare(
      PostParams(link: link),
    );
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

  _getVideo(GetVideoParams params, Emitter<PostState> emit) async {
    emit(
      state.copyWith(
        isVideoLoading: true,
      ),
    );
    final res = await _postUseCase.getVideo(params);
    res.fold((error) => emit(state), (response) {
      emit(
        state.copyWith(
          getVideoResponse: response,
        ),
      );
    });
    emit(
      state.copyWith(
        isVideoLoading: false,
      ),
    );
  }
}
