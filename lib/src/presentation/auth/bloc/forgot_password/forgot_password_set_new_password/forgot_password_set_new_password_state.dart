part of 'forgot_password_set_new_password_bloc.dart';

@freezed
class ForgotPasswordSetNewPasswordState
    with _$ForgotPasswordSetNewPasswordState {
  const factory ForgotPasswordSetNewPasswordState.initial() = _Initial;
  const factory ForgotPasswordSetNewPasswordState.loading() = _Loading;
  const factory ForgotPasswordSetNewPasswordState.loaded(
      ForgotPasswordSetNewPasswordResponseModel data) = _Loaded;
  const factory ForgotPasswordSetNewPasswordState.error(String message) =
      _Error;
}
