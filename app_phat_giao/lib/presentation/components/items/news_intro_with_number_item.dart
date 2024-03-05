import 'package:app_phat_giao/data/model/news.dart';
import 'package:app_phat_giao/presentation/app/styles/style.dart';
import 'package:app_phat_giao/presentation/journey/news/detail_news/detail_news_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NewsIntroWithNumberItem extends StatelessWidget {
  const NewsIntroWithNumberItem(
      {Key? key, required this.newsIntro, required this.number})
      : super(key: key);

  final int number;
  final NewsIntro newsIntro;

  void _onTap(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (_) => DetailNewsPage(
              newsIntro: newsIntro,
            )));
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _onTap(context),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 8.h),
            child: Row(
              children: [
                Text(
                  number.toString(),
                  style: TextStyle(fontSize: 36.sp, color: mGrayLightColor),
                ),
                SizedBox(
                  width: 16.w,
                ),
                Expanded(
                  child: Text(newsIntro.title.toString()),
                )
              ],
            ),
          ),
          Divider()
        ],
      ),
    );
  }
}
