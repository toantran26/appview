import 'package:app_phat_giao/data/model/news.dart';
import 'package:app_phat_giao/presentation/journey/news/detail_news/detail_news_page.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EventNewsItem extends StatelessWidget {
  const EventNewsItem({Key? key, required this.newsIntro}) : super(key: key);

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
    return SizedBox(
      width: ScreenUtil().screenWidth / 2.5,
      child: InkWell(
        onTap: () => _onTap(context),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CachedNetworkImage(
              imageUrl: newsIntro.image ?? '',
              width: 200.w,
              height: 100.w,
              fit: BoxFit.fill,
            ),
            SizedBox(
              height: 8.h,
            ),
            Text(
              newsIntro.title ?? '',
              style: Theme.of(context).textTheme.titleSmall,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            )
          ],
        ),
      ),
    );
  }
}
