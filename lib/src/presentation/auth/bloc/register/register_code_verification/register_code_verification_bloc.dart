import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nowdots_social_news/src/data/datasources/remote/auth/register_remote_datasources.dart';
import 'package:nowdots_social_news/src/data/models/auth/register/verification_code/register_verification_code_request_model.dart';
import 'package:nowdots_social_news/src/data/models/auth/register/verification_code/register_verification_code_response_model.dart';

part 'register_code_verification_event.dart';
part 'register_code_verification_state.dart';
part 'register_code_verification_bloc.freezed.dart';

class RegisterCodeVerificationBloc
    extends Bloc<RegisterCodeVerificationEvent, RegisterCodeVerificationState> {
  final RegisterRemoteDataSources registerRemoteDataSources;
  RegisterCodeVerificationBloc(this.registerRemoteDataSources)
      : super(_Initial()) {
    on<_CodeVerification>((event, emit) async {
      emit(_Loading());
      final response =
          await registerRemoteDataSources.verificationCode(event.requestData);
      response.fold(
        (message) => emit(_Error(message)),
        (data) => emit(_Loaded(data)),
      );
    });
  }
}
