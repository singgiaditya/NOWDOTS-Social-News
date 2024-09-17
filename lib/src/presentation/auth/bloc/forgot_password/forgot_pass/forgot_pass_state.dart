part of 'forgot_pass_bloc.dart';

@freezed
class ForgotPassState with _$ForgotPassState {
  const factory ForgotPassState.initial() = _Initial;
  const factory ForgotPassState.loading() = _Loading;
  const factory ForgotPassState.loaded(ForgotPasswordResponseModel data) = _Loaded;
  const factory ForgotPassState.error(String message) = _Error;
}
