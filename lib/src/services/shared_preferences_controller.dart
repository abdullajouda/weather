import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesController {
  static Future<SharedPreferencesController> _instance;
  static SharedPreferences _sharedPreferences;
  static Completer<SharedPreferencesController> _completer;

  SharedPreferencesController._();

  static Future<SharedPreferencesController> get instance async {
    if (_instance != null) return _instance;
    _completer = Completer<SharedPreferencesController>();
    await _init();
    _completer.complete(SharedPreferencesController._());
    return _instance = _completer.future;
  }

  static Future<void> _init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
    print('SharedPreferences initiated !');
  }

  String getAppLang() {
    return _sharedPreferences.getString('language');
  }

  Future<void> setAppLang(String lang) async {
    await _sharedPreferences.setString('language', lang);
  }

  Future<int> getAppLaunchTimes() async {
    return _sharedPreferences.getInt('launch_times') ?? 0;
  }

  Future<int> setAppLaunchTimes() async {
    int count = _sharedPreferences.getInt('launch_times') ?? 0;
    count++;
    await _sharedPreferences.setInt('launch_times', count ?? 1);
    return count;
  }


  Future<void> clear() async {
    await _sharedPreferences.clear();
  }

}
