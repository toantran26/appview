import 'package:app_phat_giao/commons/helpers/shared_prefs/shared_preferences_manager.dart';
import 'package:get/get.dart';

class SessionPref {
  static const String keyAccessToken = 'key_accessToken';
  static const String keyRefreshToken = 'key_refresh_Token';
  static const String keyUserName = 'key_user_name';

  static void saveSession(
      {required String accessToken,
      required String refreshToken,
      required String userName}) {
    var preferencesManager = Get.find<SharedPreferencesManager>();
    preferencesManager.set(keyAccessToken, accessToken);
    preferencesManager.set(keyRefreshToken, refreshToken);
    preferencesManager.set(keyUserName, userName);
  }

  static String? getUserName() =>
      Get.find<SharedPreferencesManager>().get(keyUserName);

  static String? getAccessToken() =>
      Get.find<SharedPreferencesManager>().get(keyAccessToken);

  static String? getRefreshToken() =>
      Get.find<SharedPreferencesManager>().get(keyRefreshToken);

  static bool isSessionValid() {
    try {
      return Get.find<SharedPreferencesManager>()
              .get(keyAccessToken)
              ?.isNotEmpty ==
          true;
    } catch (e) {
      return false;
    }
  }

  static Future<void> removeUserName() async {
    // await getIt.get<SharedPreferencesManager>().clear();
    final prefs = Get.find<SharedPreferencesManager>();

    await prefs.remove(keyUserName);
    await prefs.remove(keyAccessToken);
    await prefs.remove(keyRefreshToken);
  }

  static Future<void> removeTokenUserData() async {
    final prefs = Get.find<SharedPreferencesManager>();
    await prefs.remove(keyAccessToken);
    await prefs.remove(keyRefreshToken);
  }

  static Future<void> clearSessionData() async {
    // await getIt.get<SharedPreferencesManager>().clear();
    await removeTokenUserData();
    await removeUserName();
  }
}
