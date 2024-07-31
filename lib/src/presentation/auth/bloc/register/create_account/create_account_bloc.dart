import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nowdots_social_news/src/data/datasources/remote/auth/register/register_remote_datasources.dart';
import 'package:nowdots_social_news/src/data/models/auth/register/create_account/create_account_request_model.dart';
import 'package:nowdots_social_news/src/data/models/auth/register/create_account/create_account_response_model.dart';

part 'create_account_event.dart';
part 'create_account_state.dart';
part 'create_account_bloc.freezed.dart';

class CreateAccountBloc extends Bloc<CreateAccountEvent, CreateAccountState> {
  final RegisterRemoteDataSources registerRemoteDataSources;

  CreateAccountBloc(this.registerRemoteDataSources) : super(_Initial()) {
    on<_CreateAccount>((event, emit) async {
      emit(_Loading());
      final response =
          await registerRemoteDataSources.createAccount(event.requestData);
      response.fold(
          (message) => emit(_Error(message)), (data) => emit(_Loaded(data)));
    });
  }
}
