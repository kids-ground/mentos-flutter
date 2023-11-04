
import 'package:shared_preferences/shared_preferences.dart';

class LocalKeyValueDataSource {
  SharedPreferences? _db;

  Future<SharedPreferences> get database async {
    if (_db != null) return _db!;
    _db = await SharedPreferences.getInstance();
    return _db!;
  }

  Future<String?> get accessToken async => (await database).getString(LocalKey.accessToken.name);
  Future<void> deleteAccessToken() async => (await database).remove(LocalKey.accessToken.name);
  Future<void> setAccessToken(String value) async => (await database).setString(LocalKey.accessToken.name, value);

  Future<String?> get refreshToken async => (await database).getString(LocalKey.refreshToken.name);
  Future<void> deleteRefreshToken() async => (await database).remove(LocalKey.refreshToken.name);
  Future<void> setRefreshToken(String value) async => (await database).setString(LocalKey.refreshToken.name, value);
}

enum LocalKey {
  accessToken,
  refreshToken
}