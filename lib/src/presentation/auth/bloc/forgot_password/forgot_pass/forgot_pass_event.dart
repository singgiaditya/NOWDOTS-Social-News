part of 'forgot_pass_bloc.dart';

@freezed
class ForgotPassEvent with _$ForgotPassEvent {
  const factory ForgotPassEvent.forgotPassword(
      ForgotPasswordRequestModel requestData) = _ForgotPassword;
}
