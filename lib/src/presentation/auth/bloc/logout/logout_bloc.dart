import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nowdots_social_news/src/data/datasources/remote/auth/login_remote_datasources.dart';
part 'logout_event.dart';
part 'logout_state.dart';
part 'logout_bloc.freezed.dart';

class LogoutBloc extends Bloc<LogoutEvent, LogoutState> {
  final LoginLogoutRemoteDataSources loginRemoteDataSources;
  LogoutBloc(this.loginRemoteDataSources) : super(_Initial()) {
    on<_Logout>((event, emit) async {
      emit(_Loading());
      final response = await loginRemoteDataSources.logout();
      response.fold(
          (message) => emit(_Error(message)), (data) => emit(_Loaded(data)));
    });
  }
}
