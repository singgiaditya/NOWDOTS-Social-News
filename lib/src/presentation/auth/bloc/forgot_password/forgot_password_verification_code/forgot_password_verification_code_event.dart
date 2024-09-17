part of 'forgot_password_verification_code_bloc.dart';

@freezed
class ForgotPasswordVerificationCodeEvent
    with _$ForgotPasswordVerificationCodeEvent {
  const factory ForgotPasswordVerificationCodeEvent.verificationCode(
      ForgotPasswordVerificationCodeRequestModel data) = _VerificationCode;
}
