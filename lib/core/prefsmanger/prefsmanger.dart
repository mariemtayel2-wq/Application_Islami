import 'package:shared_preferences/shared_preferences.dart';

class Prefsmanger {
  static  const String lastIndexSuraKey = 'last_index_sura';
static  Future<void> saveLastindexSura(int newsuraindex) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>mostrecent =
        prefs.getStringList(Prefsmanger.lastIndexSuraKey) ?? [];
    if (mostrecent.contains('$newsuraindex')) {
      mostrecent.remove('$newsuraindex');
    }
    mostrecent.add('$newsuraindex');
    if (mostrecent.length > 5) {
      mostrecent.removeLast();
    }
    await prefs.setStringList(Prefsmanger.lastIndexSuraKey, mostrecent);
  }
 static Future<List<int>> getMostRecentSura() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final List<String> mostrecent =
        prefs.getStringList(Prefsmanger.lastIndexSuraKey) ?? [];

    return mostrecent.map(int.parse).toList();
  }
}
