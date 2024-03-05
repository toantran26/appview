import 'package:app_phat_giao/data/model/news.dart';
import 'package:app_phat_giao/data/remote_source/news_data_remote_source.dart';
import 'package:app_phat_giao/presentation/components/future_handler/future_handler.dart';
import 'package:app_phat_giao/presentation/components/items/news_intro_item.dart';
import 'package:app_phat_giao/presentation/components/layouts/error_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class Render9NewsUnderEvent extends StatefulWidget {
  const Render9NewsUnderEvent({Key? key}) : super(key: key);

  @override
  State<Render9NewsUnderEvent> createState() => _Render9NewsUnderEventState();
}

class _Render9NewsUnderEventState extends State<Render9NewsUnderEvent> {
  final NewsDataRemoteSource _newsDataRemoteSource = Get.find();

  @override
  Widget build(BuildContext context) {
    return FutureRender<List<NewsIntro>>(
      future: _newsDataRemoteSource.get9NewsUnderEvent(),
      resultWidget: (newsIntros) {
        return ListView.separated(
            itemCount: newsIntros.length,
            shrinkWrap: true,
            primary: false,
            separatorBuilder: (_, __) => SizedBox(
                  height: 16.h,
                ),
            itemBuilder: (ct, index) => NewsIntroItem(
                  newsIntro: newsIntros[index],
                ));
      },
      errorWidget: (error) {
        return ErrorLayout(
          onTryAgain: () {
            setState(() {});
          },
        );
      },
    );
  }
}
