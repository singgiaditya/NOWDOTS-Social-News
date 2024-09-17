part of 'forgot_password_verification_code_bloc.dart';

@freezed
class ForgotPasswordVerificationCodeState
    with _$ForgotPasswordVerificationCodeState {
  const factory ForgotPasswordVerificationCodeState.initial() = _Initial;
  const factory ForgotPasswordVerificationCodeState.loading() = _Loading;
  const factory ForgotPasswordVerificationCodeState.loaded(
      ForgotPasswordVerificationCodeResponseModel data) = _Loaded;
  const factory ForgotPasswordVerificationCodeState.error(String message) =
      _Error;
}
