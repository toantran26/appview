import 'package:app_phat_giao/commons/helpers/shared_prefs/shared_preferences_manager.dart';
import 'package:get/get.dart';

class LocalSettingsPref {
  static const String keyFirstRun = 'key_first_run';
  static const String keyFirstSetupNotify = 'key_first_setup_notify';

  static bool isFirstTime() {
    final prefs = Get.find<SharedPreferencesManager>();

    var isFirstTime = prefs.get(keyFirstRun);
    if (isFirstTime != null && !isFirstTime) {
      prefs.set(keyFirstRun, false);
      return false;
    } else {
      prefs.set(keyFirstRun, false);
      return true;
    }
  }

  static bool isFirstNotifySetting() {
    final prefs = Get.find<SharedPreferencesManager>();

    var isFirstTime = prefs.get(keyFirstSetupNotify);
    if (isFirstTime != null && !isFirstTime) {
      prefs.set(keyFirstSetupNotify, false);
      return false;
    } else {
      prefs.set(keyFirstSetupNotify, false);
      return true;
    }
  }

  static void resetFirstNotifySetting() {
    Get.find<SharedPreferencesManager>().set(keyFirstSetupNotify, true);
  }
}
