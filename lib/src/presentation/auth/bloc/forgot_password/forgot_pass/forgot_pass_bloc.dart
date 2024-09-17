import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nowdots_social_news/src/data/datasources/remote/auth/forgot_password_remote_datasources.dart';
import 'package:nowdots_social_news/src/data/models/auth/forgot_password/forgot_pass/forgot_password_request_model.dart';
import 'package:nowdots_social_news/src/data/models/auth/forgot_password/forgot_pass/forgot_password_response_model.dart';

part 'forgot_pass_event.dart';
part 'forgot_pass_state.dart';
part 'forgot_pass_bloc.freezed.dart';

class ForgotPassBloc extends Bloc<ForgotPassEvent, ForgotPassState> {
  final ForgotPasswordRemoteDataSources forgotPasswordRemoteDataSources;
  ForgotPassBloc(this.forgotPasswordRemoteDataSources) : super(_Initial()) {
    on<_ForgotPassword>((event, emit)  async{
      emit(_Loading());
      final result = await forgotPasswordRemoteDataSources.forgotPass(event.requestData);
      result.fold((message) => emit(_Error(message)), (data) => emit(_Loaded(data)));
    });
  }
}
