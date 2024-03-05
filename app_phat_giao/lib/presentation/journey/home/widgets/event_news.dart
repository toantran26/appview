import 'package:app_phat_giao/commons/constants/image_constants.dart';
import 'package:app_phat_giao/data/model/news.dart';
import 'package:app_phat_giao/data/remote_source/news_data_remote_source.dart';
import 'package:app_phat_giao/presentation/components/future_handler/future_handler.dart';
import 'package:app_phat_giao/presentation/components/items/event_news_item.dart';
import 'package:app_phat_giao/presentation/components/items/quote_news_intro_item.dart';
import 'package:app_phat_giao/presentation/components/layouts/error_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../app/styles/style.dart';

class EventNews extends StatefulWidget {
  const EventNews({Key? key}) : super(key: key);

  @override
  State<EventNews> createState() => _EventNewsState();
}

class _EventNewsState extends State<EventNews> {
  final NewsDataRemoteSource _newsDataRemoteSource = Get.find();

  @override
  Widget build(BuildContext context) {
    return Card(
      color: mYellowLightBackground,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 8.w),
            child: Text(
              'Sự kiện nổi bật',
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(color: mPrimaryColor),
            ),
          ),
          Image.asset(ImageConstants.keNgang),
          FutureRender<List<NewsIntro>>(
            future: _newsDataRemoteSource.getEventNews(),
            resultWidget: (newsIntros) {
              return SizedBox(
                height: 200.h,
                child: ListView.separated(
                    itemCount: newsIntros.length,
                    padding:
                        EdgeInsets.symmetric(horizontal: 8.w, vertical: 16.h),
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    separatorBuilder: (_, __) => SizedBox(
                          width: 16.w,
                        ),
                    itemBuilder: (ct, index) => EventNewsItem(
                          newsIntro: newsIntros[index],
                        )),
              );
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
      ),
    );
  }
}
