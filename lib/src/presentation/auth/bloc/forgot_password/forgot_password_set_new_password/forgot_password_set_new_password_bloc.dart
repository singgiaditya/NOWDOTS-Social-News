import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nowdots_social_news/src/data/datasources/remote/auth/forgot_password_remote_datasources.dart';
import 'package:nowdots_social_news/src/data/models/auth/forgot_password/set_new_password/forgot_password_set_new_password_request_model.dart';
import 'package:nowdots_social_news/src/data/models/auth/forgot_password/set_new_password/forgot_password_set_new_password_response_model.dart';

part 'forgot_password_set_new_password_event.dart';
part 'forgot_password_set_new_password_state.dart';
part 'forgot_password_set_new_password_bloc.freezed.dart';

class ForgotPasswordSetNewPasswordBloc extends Bloc<
    ForgotPasswordSetNewPasswordEvent, ForgotPasswordSetNewPasswordState> {
  final ForgotPasswordRemoteDataSources forgotPasswordRemoteDataSources;
  ForgotPasswordSetNewPasswordBloc(this.forgotPasswordRemoteDataSources)
      : super(_Initial()) {
    on<_SetNewPassword>((event, emit) async {
      emit(_Loading());
      final result = await forgotPasswordRemoteDataSources
          .setNewPassword(event.requestData);
      result.fold((message) => emit(_Error(message)),
          (data) => emit(_Loaded(data)));
    });
  }
}
