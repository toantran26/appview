import 'package:app_phat_giao/di/di/module/api_module.dart';
import 'package:app_phat_giao/di/di/module/components_module.dart';
import 'package:app_phat_giao/di/di/module/local_module.dart';
import 'package:app_phat_giao/di/di/module/repo_module.dart';

class Injection {
  static Future inject() async {
    ComponentsModule().provides();
    LocalModule().provides();
    await ApiModule().provides();
    RepoModule().provides();
    // await UseCaseModule().provides();
  }
}
