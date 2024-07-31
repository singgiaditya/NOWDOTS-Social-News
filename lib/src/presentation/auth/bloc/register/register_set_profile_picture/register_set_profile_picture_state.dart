part of 'register_set_profile_picture_bloc.dart';

@freezed
class RegisterSetProfilePictureState with _$RegisterSetProfilePictureState {
  const factory RegisterSetProfilePictureState.initial() = _Initial;
  const factory RegisterSetProfilePictureState.loading() = _Loading;
  const factory RegisterSetProfilePictureState.loaded(RegisterSetProfilePictureResponseModel data) = _Loaded;
  const factory RegisterSetProfilePictureState.error(String message) = _Error;
}
