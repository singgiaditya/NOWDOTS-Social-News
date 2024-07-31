part of 'register_code_verification_bloc.dart';

@freezed
class RegisterCodeVerificationEvent with _$RegisterCodeVerificationEvent {
  const factory RegisterCodeVerificationEvent.codeVerification(RegisterVerificationCodeRequestModel requestData) = _CodeVerification;
}