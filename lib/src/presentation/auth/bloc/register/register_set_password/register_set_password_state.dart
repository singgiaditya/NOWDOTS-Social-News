part of 'register_set_password_bloc.dart';

@freezed
class RegisterSetPasswordState with _$RegisterSetPasswordState {
  const factory RegisterSetPasswordState.initial() = _Initial;
  const factory RegisterSetPasswordState.loading() = _Loading;
  const factory RegisterSetPasswordState.loaded(RegisterSetPasswordResponseModel data) = _Loaded;
  const factory RegisterSetPasswordState.error(String message) = _Error;
}
