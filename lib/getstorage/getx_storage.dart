

import 'package:get_storage/get_storage.dart';

class LocalPreference {
  Future<void> setPrefValue(String key, String value) async {
    final prefs = GetStorage();
    return await prefs.write(key, value);
  }

  Future<void> setintPrefValue(String key, int value) async {
    final prefs = GetStorage();
    return await prefs.write(key, value);
  }
   Future<void> setloginValue(String key, bool value) async {
    final prefs = GetStorage();
    return await prefs.write(key, value);
  }

  dynamic getPrefValue(String key) {
    final prefs = GetStorage();
    return prefs.read(key);
  }

  dynamic getloginValue(String key) {
    final prefs = GetStorage();
    return prefs.read(key);
  }
}
