import 'package:get_it/get_it.dart';
import 'package:nowdots_social_news/src/data/datasources/local/feed/feed_local_datasources.dart';
import 'package:nowdots_social_news/src/data/datasources/remote/auth/register/register_remote_datasources.dart';
import 'package:nowdots_social_news/src/presentation/auth/bloc/register/create_account/create_account_bloc.dart';
import 'package:nowdots_social_news/src/presentation/auth/bloc/register/register_code_verification/register_code_verification_bloc.dart';
import 'package:nowdots_social_news/src/presentation/auth/bloc/register/register_set_password/register_set_password_bloc.dart';
import 'package:nowdots_social_news/src/presentation/auth/bloc/register/register_set_profile_picture/register_set_profile_picture_bloc.dart';
import 'package:nowdots_social_news/src/presentation/auth/bloc/register/register_set_username/register_set_username_bloc.dart';
import 'package:nowdots_social_news/src/presentation/feed/bloc/drawer/drawer_bloc.dart';
import 'package:nowdots_social_news/src/presentation/feed/bloc/get_all_feeds/get_all_feeds_bloc.dart';

final sl = GetIt.instance;

Future<void> initializieDependencies() async {
  //data-sources
  sl.registerFactory<FeedLocalDatasources>(() => FeedLocalDatasources());
  sl.registerFactory<RegisterRemoteDataSources>(
      () => RegisterRemoteDataSources());

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
}
