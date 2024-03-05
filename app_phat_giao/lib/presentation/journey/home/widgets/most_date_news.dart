import 'package:app_phat_giao/commons/constants/image_constants.dart';
import 'package:app_phat_giao/data/model/news.dart';
import 'package:app_phat_giao/data/remote_source/news_data_remote_source.dart';
import 'package:app_phat_giao/presentation/components/future_handler/future_handler.dart';
import 'package:app_phat_giao/presentation/components/items/event_news_item.dart';
import 'package:app_phat_giao/presentation/components/items/news_intro_with_number_item.dart';
import 'package:app_phat_giao/presentation/components/items/quote_news_intro_item.dart';
import 'package:app_phat_giao/presentation/components/layouts/error_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../app/styles/style.dart';

class MostDateNews extends StatefulWidget {
  const MostDateNews({Key? key}) : super(key: key);

  @override
  State<MostDateNews> createState() => _MostDateNewsState();
}

class _MostDateNewsState extends State<MostDateNews> {
  final NewsDataRemoteSource _newsDataRemoteSource = Get.find();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 8.w),
          child: Text(
            'Tin mới nhất',
            style: Theme.of(context)
                .textTheme
                .titleMedium
                ?.copyWith(color: mPrimaryColor),
          ),
        ),
        Image.asset(ImageConstants.keNgang),
        FutureRender<List<NewsIntro>>(
          future: _newsDataRemoteSource.getMostDateNews(),
          resultWidget: (newsIntros) {
            return ListView.builder(
                itemCount: newsIntros.length,
                shrinkWrap: true,
                primary: false,
                itemBuilder: (ct, index) => NewsIntroWithNumberItem(
                      newsIntro: newsIntros[index],
                      number: index + 1,
                    ));
          },
          errorWidget: (error) {
            return ErrorLayout(
              onTryAgain: () {
                setState(() {});
              },
            );
          },
        ),
      ],
    );
  }
}
