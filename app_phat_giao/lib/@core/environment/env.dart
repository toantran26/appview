import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:app_phat_giao/@core/network/http_overrides.dart';
import 'package:app_phat_giao/commons/constants/app_default_constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'build_config.dart';

abstract class Env {
  Env() {
    _init();
  }

  _init() {
    runZoned(() async {
      WidgetsFlutterBinding.ensureInitialized();

      /// Get flavor from native
      await const MethodChannel('flavor')
          .invokeMethod<String>('getFlavor')
          .then((String? flavor) async {
        BuildConfig.init(flavor: flavor);
      }).catchError((error) {
        BuildConfig.init();
      });

      /// Init external service
      await onInitExternalService();

      /// Init local storage
      await onInitInternalService();

      /// DI
      await onInjection();

      HttpOverrides.global = MyHttpOverrides(); // use in run zone

      final StatelessWidget app = await onCreate(); // return init widget
      final wrapMultiScreen = ScreenUtilInit(
        designSize: AppDefaultConstants.designSize,
        builder: (ct, child) => app,
      );

      runApp(wrapMultiScreen);
      // ignore: deprecated_member_use
    }, onError: (Object obj, StackTrace stack) {
      print(obj);
      print(stack);
    });
  }

  Future? onInjection();

  Future? onInitInternalService();

  Future? onInitExternalService();

  FutureOr<StatelessWidget> onCreate();
}
