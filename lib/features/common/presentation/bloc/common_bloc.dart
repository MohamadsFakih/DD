import 'package:bloc/bloc.dart';
import 'package:digital_defender/features/common/domain/usecase/common_usecase.dart';
import 'package:digital_defender/features/login/data/models/login_params.dart';
import 'package:digital_defender/features/post_share/data/model/get_video_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'common_event.dart';
part 'common_state.dart';
part 'common_bloc.freezed.dart';

class CommonBloc extends Bloc<CommonEvent, CommonState> {
  CommonBloc(this._commonUseCase) : super(const CommonState.initial()) {
    on<CommonEvent>((event, emit) async {
      await event.when(
          getVideo: (int type, int socialType) =>
              _getVideo(type, socialType, emit),
          addUserData: (LoginResponse loginResponse) =>
              _adduserData(loginResponse, emit));
    });
  }

  final CommonUseCase _commonUseCase;
  Future _getVideo(int type, int socialType, Emitter<CommonState> emit) async {
    emit(
      state.copyWith(
        isLoading: true,
      ),
    );
    final res = await _commonUseCase.getVideo(type, socialType);

    res.fold((error) => emit(state), (response) {
      emit(
        state.copyWith(
          videoResponse: response,
        ),
      );
    });
    emit(
      state.copyWith(
        isLoading: false,
      ),
    );
  }

  Future _adduserData(
      LoginResponse loginResponse, Emitter<CommonState> emit) async {
    emit(
      state.copyWith(
        isLoading: true,
      ),
    );
    emit(
      state.copyWith(
        loginResponse: loginResponse,
      ),
    );
    emit(
      state.copyWith(
        isLoading: false,
      ),
    );
  }
}
