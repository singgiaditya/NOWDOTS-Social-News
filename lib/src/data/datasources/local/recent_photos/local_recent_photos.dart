import 'package:photo_manager/photo_manager.dart';

class LocalRecentPhotos {
  static Future<List<AssetEntity>> getRecentPhotos(int items) async {
    final PermissionState ps = await PhotoManager.requestPermissionExtend(
        requestOption: PermissionRequestOption(
            androidPermission:
                AndroidPermission(type: RequestType(1), mediaLocation: false)));
    if (ps.isAuth) {
      final albums = await PhotoManager.getAssetListRange(
          start: 0, end: items, type: RequestType.image);
      print("albums: ${albums.length}");
      return albums;
    } else {
      return [];
    }
  }
}
