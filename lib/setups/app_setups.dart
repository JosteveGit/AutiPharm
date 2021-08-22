import 'firebase/firebase_setup.dart';
import 'preferences/preferences_setup.dart';

class AppSetups {
  static Future<void> run() async {
    await FirebaseSetup.run();
    await PreferencesSetup.run();
  }
}
