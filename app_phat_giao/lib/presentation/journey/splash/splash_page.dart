import 'package:app_phat_giao/commons/utils/utils.dart';
import 'package:app_phat_giao/data/model/models.dart';
import 'package:app_phat_giao/data/remote_source/master_data_remote_source.dart';
import 'package:app_phat_giao/presentation/components/future_handler/future_handler.dart';
import 'package:app_phat_giao/presentation/components/layouts/error_layout.dart';
import 'package:app_phat_giao/presentation/journey/main/main_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  // final scfKey = GlobalKey();

  final MasterDataRemoteSource _masterSource = Get.find();

  @override
  void initState() {
    super.initState();
    // Utils.afterBuild(() async {
    //   await Future.delayed(const Duration(seconds: 3));
    //   if (scfKey.currentContext != null) {
    //     Navigator.pushReplacement(scfKey.currentContext!,
    //         MaterialPageRoute(builder: (_) => MainPage(categories: categories)));
    //   }
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureRender<List<Category>>(
          future: _masterSource.getCategoriesMenu(),
          errorWidget: (error) {
            return ErrorLayout(
              onTryAgain: () {
                setState(() {});
              },
            );
          },
          resultWidget: (categories) {
            return MainPage(categories: categories);
          }),
    );
  }
}
