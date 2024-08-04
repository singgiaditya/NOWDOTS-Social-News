part of 'register_set_username_bloc.dart';

@freezed
class RegisterSetUsernameEvent with _$RegisterSetUsernameEvent {
  const factory RegisterSetUsernameEvent.setUsername(
      RegisterSetUsernameUserRequestModel requestData) = _SetUsername;
}
