
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

  Future<List<String>?> get bookMarkedMentorList async => (await database).getStringList(LocalKey.bookMarkedMentorList.name);
  Future<void> deleteBookMarkedMentor(int id) async {
    final mentorList = (await bookMarkedMentorList)?.map((i) => int.parse(i)).toList() ?? <int>[];
    mentorList.remove(id);
    (await database).setStringList(LocalKey.bookMarkedMentorList.name, mentorList.map((e) => '$e').toList());
  }
  Future<void> addBookMarkedMentor(int id) async {
    final mentorList = (await bookMarkedMentorList) ?? <String>[];
    mentorList.add('$id');
    (await database).setStringList(LocalKey.bookMarkedMentorList.name, mentorList);
  }
}

enum LocalKey {
  accessToken,
  refreshToken,
  bookMarkedMentorList
}