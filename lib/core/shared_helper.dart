import 'package:shared_preferences/shared_preferences.dart';

class SharedHelper {
   static SharedPreferences? _prefs;

  static Future<void> init() async =>
      _prefs = await SharedPreferences.getInstance();

  static Future<void> setId(String value) async =>
      await _prefs!.setString('id', value);

  static Future<void> setToken(String? value) async =>
      await _prefs!.setString('token', value!);
  static Future<void> setName(String value) async =>
      await _prefs!.setString('name', value);
  static Future<void> setPhone(String value) async =>
      await _prefs!.setString('phone', value);

  static Future<void> setEmail(String value) async =>
      await _prefs!.setString('email', value);
  static Future<void> setImage(String value) async =>
      await _prefs!.setString('image', value);

   static Future<void> setIfav(List<String> value) async =>
       await _prefs!.setStringList('list', value);

  static bool get isLogged => _prefs!.containsKey('token');

  static String? get getId => _prefs!.getString('id');

  static String? get getToken => _prefs!.getString('token');

  static String? get getPhone => _prefs!.getString('phone');

  static String? get getEmail => _prefs!.getString('email');

  static String? get getName => _prefs!.getString('name');

  static String? get getImage => _prefs!.getString('image');

  static List? get getIfav => _prefs!.getStringList('list');

}
