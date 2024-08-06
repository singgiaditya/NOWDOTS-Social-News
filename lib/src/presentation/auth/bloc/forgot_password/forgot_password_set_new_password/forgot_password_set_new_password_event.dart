part of 'forgot_password_set_new_password_bloc.dart';

@freezed
class ForgotPasswordSetNewPasswordEvent
    with _$ForgotPasswordSetNewPasswordEvent {
  const factory ForgotPasswordSetNewPasswordEvent.setNewPassword(ForgotPasswordSetNewPasswordRequestModel requestData) =
      _SetNewPassword;
}
