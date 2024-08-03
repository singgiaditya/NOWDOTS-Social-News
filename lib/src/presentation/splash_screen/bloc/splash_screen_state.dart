part of 'splash_screen_bloc.dart';

@freezed
class SplashScreenState with _$SplashScreenState {
  const factory SplashScreenState.initial() = _Initial;
  const factory SplashScreenState.loading() = _Loading;
  const factory SplashScreenState.withAuth() = _WithAuth;
  const factory SplashScreenState.notAuth() = _NotAuth;
}
