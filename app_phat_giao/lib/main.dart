import 'dart:async';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import '@core/environment/env.dart';
import 'package:app_phat_giao/presentation/app/styles/style.dart';
import 'di/di/injection/injection.dart';
import 'presentation/app/app.dart';

void main() {
  Main();
}

class Main extends Env {
  @override
  FutureOr<StatelessWidget> onCreate() async {
    ErrorWidget.builder = (FlutterErrorDetails details) {
      Zone.current.handleUncaughtError(details.exception, details.stack!);
      return Container(color: Colors.transparent);
    };

    await Style.styleDefault();

    return const Application(
      title: 'phatgiao.org.vn',
      locale: 'vi',
    );
  }

  @override
  Future? onInitExternalService() => null;

  @override
  Future? onInjection() => Injection.inject();

  @override
  Future? onInitInternalService() async {
    await initializeDateFormatting('vi', null);
  }
}
