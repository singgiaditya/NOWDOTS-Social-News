part of 'register_set_password_bloc.dart';

@freezed
class RegisterSetPasswordEvent with _$RegisterSetPasswordEvent {
  const factory RegisterSetPasswordEvent.setPassword(
      RegisterSetPasswordRequestModel requestData) = _SetPassword;
}
