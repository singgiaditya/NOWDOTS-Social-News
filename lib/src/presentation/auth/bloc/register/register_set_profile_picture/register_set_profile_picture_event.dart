part of 'register_set_profile_picture_bloc.dart';

@freezed
class RegisterSetProfilePictureEvent with _$RegisterSetProfilePictureEvent {
  const factory RegisterSetProfilePictureEvent.setProfilePicture(RegisterSetProfilePictureRequestModel requestData) = _SetProfilePicture;
}