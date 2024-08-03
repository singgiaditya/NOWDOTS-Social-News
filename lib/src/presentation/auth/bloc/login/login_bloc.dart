import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nowdots_social_news/src/data/datasources/remote/auth/login_remote_datasources.dart';
import 'package:nowdots_social_news/src/data/models/auth/login/login_request_model.dart';
import 'package:nowdots_social_news/src/data/models/auth/login/login_response_model.dart';

part 'login_event.dart';
part 'login_state.dart';
part 'login_bloc.freezed.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginRemoteDataSources loginRemoteDataSources;
  LoginBloc(this.loginRemoteDataSources) : super(_Initial()) {
    on<_Login>((event, emit) async {
      emit(_Loading());
      final response = await loginRemoteDataSources.login(event.requestData);
      response.fold(
          (message) => emit(_Error(message)), (data) => emit(_Loaded(data)));
    });
  }
}
