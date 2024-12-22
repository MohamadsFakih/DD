import 'package:bloc/bloc.dart';
import 'package:digital_defender/core/utils/constants/app_constants.dart';
import 'package:digital_defender/core/utils/constants/constant_functions.dart';
import 'package:digital_defender/features/login/data/models/login_params.dart';
import 'package:digital_defender/features/login/domain/usecase/login_usecase.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'login_event.dart';
part 'login_state.dart';
part 'login_bloc.freezed.dart';

@injectable
class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc(this._loginUseCase) : super(const LoginState.initial()) {
    on<LoginEvent>((event, emit) async {
      await event.when(login: (LoginParams params) => _login(params, emit));
    });
  }

  final LoginUseCase _loginUseCase;
  Future _login(LoginParams params, Emitter<LoginState> emit) async {
    emit(
      state.copyWith(isLoading: true),
    );
    final res = await _loginUseCase.login(params);
    res.fold(
      (error) {
        showTopSnackbar(
          title: "Error",
          message: "Something went wrong, please try again",
        );
        logger.d(error);
      },
      (response) {
        emit(
          state.copyWith(
            loginResponse: response,
          ),
        );
      },
    );
    emit(
      state.copyWith(isLoading: false),
    );
  }
}
