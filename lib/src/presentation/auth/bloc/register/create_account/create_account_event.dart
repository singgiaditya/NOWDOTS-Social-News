part of 'create_account_bloc.dart';

@freezed
class CreateAccountEvent with _$CreateAccountEvent {
  const factory CreateAccountEvent.createAccount(
      CreateAccountRequestModel requestData) = _CreateAccount;
}
