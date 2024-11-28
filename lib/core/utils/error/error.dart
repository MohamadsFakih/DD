import 'package:freezed_annotation/freezed_annotation.dart';

part 'error.freezed.dart';

@freezed
class Error with _$Error {
  const factory Error.httpInternalServerError(String errorBody) =
      HttpInternalServerError;

  const factory Error.httpUnAuthorizedError() = HttpUnAuthorizedError;

  const factory Error.httpUnknownError(String message) = HttpUnknownError;

  const factory Error.firebaseAuthError(String message) = FirebaseAuthError;

  const factory Error.auth0AuthError(String message) = Auth0AuthError;

  const factory Error.customErrorType(String message) = CustomErrorType;
}
