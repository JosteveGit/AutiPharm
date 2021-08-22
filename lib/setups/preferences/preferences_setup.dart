import 'package:auti_pharm/core/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferencesSetup {
  static Future<void> run() async {
    preferences = await SharedPreferences.getInstance();
  }
}
