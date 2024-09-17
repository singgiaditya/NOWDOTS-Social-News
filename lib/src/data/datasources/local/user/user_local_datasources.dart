import 'package:dartz/dartz.dart';
import 'package:nowdots_social_news/src/data/models/auth/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserLocalDatasources {
  final SharedPreferences prefs;
  UserLocalDatasources(this.prefs);

  Future<Either<String, UserModel>> getLocalUser() async {
    try {
      final data = prefs.getString("user");
      UserModel dataModel = UserModel.fromRawJson(data!);
      return Right(dataModel);
    } catch (e) {
      return Left(e.toString());
    }
  }
}
