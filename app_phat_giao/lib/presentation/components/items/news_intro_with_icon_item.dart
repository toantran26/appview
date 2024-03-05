import 'package:app_phat_giao/data/model/news.dart';
import 'package:app_phat_giao/presentation/app/styles/style.dart';
import 'package:app_phat_giao/presentation/journey/news/detail_news/detail_news_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NewsIntroWithIconItem extends StatelessWidget {
  const NewsIntroWithIconItem(
      {Key? key, required this.newsIntro, required this.icon})
      : super(key: key);

  final IconData icon;
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
                Icon(
                  icon,
                  size: 32,
                  color: mGrayLightColor,
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
