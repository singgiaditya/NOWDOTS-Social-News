part of 'get_user_bloc.dart';

@freezed
class GetUserState with _$GetUserState {
  const factory GetUserState.initial() = _Initial;
  const factory GetUserState.loading() = _Loading;
  const factory GetUserState.loaded(UserModel data) = _Loaded;
  const factory GetUserState.error(String Message) = _Error;
}
