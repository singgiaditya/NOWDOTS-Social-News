part of 'create_account_bloc.dart';

@freezed
class CreateAccountState with _$CreateAccountState {
  const factory CreateAccountState.initial() = _Initial;
  const factory CreateAccountState.loading() = _Loading;
  const factory CreateAccountState.loaded(CreateAccountResponseModel data) = _Loaded;
  const factory CreateAccountState.error(String message) = _Error;
}
