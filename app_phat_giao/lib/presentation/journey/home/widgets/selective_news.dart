import 'package:app_phat_giao/commons/constants/image_constants.dart';
import 'package:app_phat_giao/data/model/news.dart';
import 'package:app_phat_giao/data/remote_source/news_data_remote_source.dart';
import 'package:app_phat_giao/presentation/components/future_handler/future_handler.dart';
import 'package:app_phat_giao/presentation/components/items/event_news_item.dart';
import 'package:app_phat_giao/presentation/components/items/news_intro_with_icon_item.dart';
import 'package:app_phat_giao/presentation/components/items/news_intro_with_number_item.dart';
import 'package:app_phat_giao/presentation/components/items/quote_news_intro_item.dart';
import 'package:app_phat_giao/presentation/components/layouts/error_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../app/styles/style.dart';

class SelectiveNews extends StatefulWidget {
  const SelectiveNews({Key? key}) : super(key: key);

  @override
  State<SelectiveNews> createState() => _SelectiveNewsState();
}

class _SelectiveNewsState extends State<SelectiveNews> {
  final NewsDataRemoteSource _newsDataRemoteSource = Get.find();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 8.w),
          child: Text(
            'Tin chọn lọc',
            style: Theme.of(context)
                .textTheme
                .titleMedium
                ?.copyWith(color: mPrimaryColor),
          ),
        ),
        Image.asset(ImageConstants.keNgang),
        FutureRender<List<NewsIntro>>(
          future: _newsDataRemoteSource.getSelectiveNews(),
          resultWidget: (newsIntros) {
            return ListView.builder(
                itemCount: newsIntros.length,
                shrinkWrap: true,
                primary: false,
                itemBuilder: (ct, index) => NewsIntroWithIconItem(
                      newsIntro: newsIntros[index],
                      icon: Icons.comment,
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
