import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nowdots_social_news/src/data/datasources/remote/auth/register_remote_datasources.dart';
import 'package:nowdots_social_news/src/data/models/auth/register/set_password/register_set_password_request_model.dart';
import 'package:nowdots_social_news/src/data/models/auth/register/set_password/register_set_password_response_model.dart';

part 'register_set_password_event.dart';
part 'register_set_password_state.dart';
part 'register_set_password_bloc.freezed.dart';

class RegisterSetPasswordBloc
    extends Bloc<RegisterSetPasswordEvent, RegisterSetPasswordState> {
      final RegisterRemoteDataSources registerRemoteDataSouce;
  RegisterSetPasswordBloc(this.registerRemoteDataSouce) : super(_Initial()) {
    on<_SetPassword>((event, emit) async {
      emit(_Loading());
      final result = await registerRemoteDataSouce.setPassword(event.requestData);
      result.fold((message) => emit(_Error(message)), (data) => emit(_Loaded(data)));
    });
  }
}
