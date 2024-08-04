part of 'register_set_username_bloc.dart';

@freezed
class RegisterSetUsernameState with _$RegisterSetUsernameState {
  const factory RegisterSetUsernameState.initial() = _Initial;
  const factory RegisterSetUsernameState.loading() = _Loading;
  const factory RegisterSetUsernameState.loaded(RegisterSetUsernameUserResponseModel data) = _Loaded;
  const factory RegisterSetUsernameState.error(String message) = _Error;
}
