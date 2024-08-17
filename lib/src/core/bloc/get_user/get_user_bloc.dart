import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nowdots_social_news/src/data/datasources/local/user/user_local_datasources.dart';
import 'package:nowdots_social_news/src/data/models/auth/user_model.dart';

part 'get_user_event.dart';
part 'get_user_state.dart';
part 'get_user_bloc.freezed.dart';

class GetUserBloc extends Bloc<GetUserEvent, GetUserState> {
  final UserLocalDatasources userLocalDataSources;
  GetUserBloc(this.userLocalDataSources) : super(_Initial()) {
    on<_GetLocalUser>((event, emit) async {
      emit(_Loading());
      final result = await userLocalDataSources.getLocalUser();
      result.fold((l) => emit(_Error(l)), (r) => emit(_Loaded(r)));
    });
  }
}
