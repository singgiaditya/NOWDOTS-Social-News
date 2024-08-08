import 'package:get_it/get_it.dart';
import 'package:nowdots_social_news/src/data/datasources/local/feed/feed_local_datasources.dart';
import 'package:nowdots_social_news/src/data/datasources/remote/auth/forgot_password_remote_datasources.dart';
import 'package:nowdots_social_news/src/data/datasources/remote/auth/login_remote_datasources.dart';
import 'package:nowdots_social_news/src/data/datasources/remote/auth/register_remote_datasources.dart';
import 'package:nowdots_social_news/src/presentation/auth/bloc/forgot_password/forgot_pass/forgot_pass_bloc.dart';
import 'package:nowdots_social_news/src/presentation/auth/bloc/forgot_password/forgot_password_set_new_password/forgot_password_set_new_password_bloc.dart';
import 'package:nowdots_social_news/src/presentation/auth/bloc/forgot_password/forgot_password_verification_code/forgot_password_verification_code_bloc.dart';
import 'package:nowdots_social_news/src/presentation/auth/bloc/login/login_bloc.dart';
import 'package:nowdots_social_news/src/presentation/auth/bloc/logout/logout_bloc.dart';
import 'package:nowdots_social_news/src/presentation/auth/bloc/register/create_account/create_account_bloc.dart';
import 'package:nowdots_social_news/src/presentation/auth/bloc/register/register_code_verification/register_code_verification_bloc.dart';
import 'package:nowdots_social_news/src/presentation/auth/bloc/register/register_set_password/register_set_password_bloc.dart';
import 'package:nowdots_social_news/src/presentation/auth/bloc/register/register_set_profile_picture/register_set_profile_picture_bloc.dart';
import 'package:nowdots_social_news/src/presentation/auth/bloc/register/register_set_username/register_set_username_bloc.dart';
import 'package:nowdots_social_news/src/presentation/feed/bloc/drawer/drawer_bloc.dart';
import 'package:nowdots_social_news/src/presentation/feed/bloc/get_all_feeds/get_all_feeds_bloc.dart';
import 'package:nowdots_social_news/src/presentation/splash_screen/bloc/splash_screen_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

Future<void> initializieDependencies() async {
  //shared preferences
  sl.registerSingletonAsync<SharedPreferences>(
      () => SharedPreferences.getInstance());

  //data-sources
  sl.registerFactory<FeedLocalDatasources>(() => FeedLocalDatasources());
  sl.registerFactory<RegisterRemoteDataSources>(
      () => RegisterRemoteDataSources(sl()));
  sl.registerFactory<LoginLogoutRemoteDataSources>(
      () => LoginLogoutRemoteDataSources(sl()));
  sl.registerFactory<ForgotPasswordRemoteDataSources>(
      () => ForgotPasswordRemoteDataSources(sl()));

  //blocs
  sl.registerFactory<DrawerBloc>(() => DrawerBloc());
  sl.registerFactory<GetAllFeedsBloc>(() => GetAllFeedsBloc(sl()));
  sl.registerFactory<CreateAccountBloc>(() => CreateAccountBloc(sl()));
  sl.registerFactory<RegisterCodeVerificationBloc>(
      () => RegisterCodeVerificationBloc(sl()));
  sl.registerFactory<RegisterSetPasswordBloc>(
      () => RegisterSetPasswordBloc(sl()));
  sl.registerFactory<RegisterSetProfilePictureBloc>(
      () => RegisterSetProfilePictureBloc(sl()));
  sl.registerFactory<RegisterSetUsernameBloc>(
      () => RegisterSetUsernameBloc(sl()));
  sl.registerFactory<LoginBloc>(() => LoginBloc(sl()));
  sl.registerFactory<SplashScreenBloc>(() => SplashScreenBloc(sl()));
  sl.registerFactory<ForgotPassBloc>(() => ForgotPassBloc(sl()));
  sl.registerFactory<ForgotPasswordVerificationCodeBloc>(
      () => ForgotPasswordVerificationCodeBloc(sl()));
  sl.registerFactory<ForgotPasswordSetNewPasswordBloc>(
      () => ForgotPasswordSetNewPasswordBloc(sl()));
  sl.registerFactory<LogoutBloc>(() => LogoutBloc(sl()));
}
