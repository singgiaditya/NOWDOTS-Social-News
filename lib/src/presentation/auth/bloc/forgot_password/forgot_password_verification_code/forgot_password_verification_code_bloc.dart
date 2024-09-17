import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nowdots_social_news/src/data/datasources/remote/auth/forgot_password_remote_datasources.dart';
import 'package:nowdots_social_news/src/data/models/auth/forgot_password/verification/forgot_password_verification_code_request_model.dart';
import 'package:nowdots_social_news/src/data/models/auth/forgot_password/verification/forgot_password_verification_response_model.dart';

part 'forgot_password_verification_code_event.dart';
part 'forgot_password_verification_code_state.dart';
part 'forgot_password_verification_code_bloc.freezed.dart';

class ForgotPasswordVerificationCodeBloc extends Bloc<
    ForgotPasswordVerificationCodeEvent, ForgotPasswordVerificationCodeState> {
  final ForgotPasswordRemoteDataSources forgotPasswordRemoteDataSources;
  ForgotPasswordVerificationCodeBloc(this.forgotPasswordRemoteDataSources)
      : super(_Initial()) {
    on<_VerificationCode>((event, emit) async {
      emit(_Loading());
      final result = await forgotPasswordRemoteDataSources
          .verificationCode(event.data);
      result.fold((message) => emit(_Error(message)),
          (data) => emit(_Loaded(data)));
    });
  }
}
