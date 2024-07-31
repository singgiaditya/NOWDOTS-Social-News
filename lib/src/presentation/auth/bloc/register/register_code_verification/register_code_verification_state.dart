part of 'register_code_verification_bloc.dart';

@freezed
class RegisterCodeVerificationState with _$RegisterCodeVerificationState {
  const factory RegisterCodeVerificationState.initial() = _Initial;
  const factory RegisterCodeVerificationState.loading() = _Loading;
  const factory RegisterCodeVerificationState.loaded(
      RegisterVerificationCodeResponseModel data) = _Loaded;
  const factory RegisterCodeVerificationState.error(String message) = _Error;
}
