import 'package:app_phat_giao/route/app_route.dart';
import 'package:flutter/material.dart';
import 'package:app_phat_giao/commons/utils/utils.dart';
import 'package:get/get.dart';
import 'bindings/app_binding.dart';
import 'styles/style.dart';

class Application extends StatelessWidget {
  final String title;
  final String locale;

  const Application({Key? key, required this.title, required this.locale})
      : super(key: key);

  Widget _builder(BuildContext context, Widget? child) {
    return MediaQuery(
      ///Setting font does not change with system font size
      data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
      child: child!,
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Utils.unFocusField(context),
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: title,
        theme: AppThemes.defaultTheme(),
        initialBinding: AppBinding(),
        initialRoute: AppRoute.INITIAL,
        getPages: AppRoute.pages,
        builder: (context, widget) => _builder(context, widget),
      ),
    );
  }
}
