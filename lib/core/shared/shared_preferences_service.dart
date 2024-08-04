import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  SharedPreferencesService._();
  static late final SharedPreferences sp;
  static Future<void> init() async {
    sp = await SharedPreferences.getInstance();
  }

  static Future<void> storeToken(String token) async {
    await sp.setString('token', token);
  }

  static String? getToken() {
    return sp.getString('token');
  }

  static Future<void> storeType(String type) async {
    await sp.setString('type', type);
  }

  static String? getType() {
    return sp.getString('type');
  }

  static Future<void> storeFirstTime() async {
    await sp.setBool('firstTime', true);
  }

  static bool? getFirstTime() {
    return sp.getBool('firstTime');
  }

  static Future<bool> clearAll() async {
    return await sp.clear();
  }
}
