import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nowdots_social_news/src/data/datasources/remote/auth/register_remote_datasources.dart';
import 'package:nowdots_social_news/src/data/models/auth/register/set_profile_picture/register_set_profile_picture_request_model.dart';
import 'package:nowdots_social_news/src/data/models/auth/register/set_profile_picture/register_set_profile_picture_response_model.dart';

part 'register_set_profile_picture_event.dart';
part 'register_set_profile_picture_state.dart';
part 'register_set_profile_picture_bloc.freezed.dart';

class RegisterSetProfilePictureBloc extends Bloc<RegisterSetProfilePictureEvent,
    RegisterSetProfilePictureState> {
  final RegisterRemoteDataSources _remoteDataSource;
  RegisterSetProfilePictureBloc(this._remoteDataSource) : super(_Initial()) {
    on<_SetProfilePicture>((event, emit) async {
      emit(_Loading());
      final response =
          await _remoteDataSource.setProfilePicture(event.requestData);
      response.fold(
          (message) => emit(_Error(message)), (data) => emit(_Loaded(data)));
    });
    on<_SkipProfilePicture>((event, emit) async {
      emit(_Loading());
      final response = await _remoteDataSource.skipProfilePicture(event.email);
      response.fold(
          (message) => emit(_Error(message)), (data) => emit(_Loaded(data)));
    });
  }
}
