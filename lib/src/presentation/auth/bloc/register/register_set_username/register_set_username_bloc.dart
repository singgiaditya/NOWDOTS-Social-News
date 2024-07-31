import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nowdots_social_news/src/data/datasources/remote/auth/register/register_remote_datasources.dart';
import 'package:nowdots_social_news/src/data/models/auth/register/set_username_user/register_set_username_user_request_model.dart';
import 'package:nowdots_social_news/src/data/models/auth/register/set_username_user/register_set_username_user_response_model.dart';

part 'register_set_username_event.dart';
part 'register_set_username_state.dart';
part 'register_set_username_bloc.freezed.dart';

class RegisterSetUsernameBloc
    extends Bloc<RegisterSetUsernameEvent, RegisterSetUsernameState> {
  final RegisterRemoteDataSources remoteDataSource;
  RegisterSetUsernameBloc(this.remoteDataSource) : super(_Initial()) {
    on<_SetUsername>((event, emit) async {
      emit(_Loading());
      final response = await remoteDataSource.setUsername(event.requestData);
      response.fold(
          (message) => emit(_Error(message)), (data) => emit(_Loaded(data)));
    });
  }
}
