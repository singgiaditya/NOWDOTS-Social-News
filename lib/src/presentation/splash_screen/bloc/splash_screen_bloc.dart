import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'splash_screen_event.dart';
part 'splash_screen_state.dart';
part 'splash_screen_bloc.freezed.dart';

class SplashScreenBloc extends Bloc<SplashScreenEvent, SplashScreenState> {
  final SharedPreferences prefs;
  SplashScreenBloc(this.prefs) : super(const _Initial()) {
    on<_CheckAuth>((event, emit) async {
      emit(const _Loading());
      final token = prefs.getString("token");

      if (token == null) {
        return emit(const _NotAuth());
      }

      return emit(const _WithAuth());
    });
  }
}
