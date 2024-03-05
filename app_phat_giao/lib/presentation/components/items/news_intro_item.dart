import 'package:app_phat_giao/data/model/news.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../journey/news/detail_news/detail_news_page.dart';

class NewsIntroItem extends StatelessWidget {
  const NewsIntroItem({Key? key, required this.newsIntro}) : super(key: key);

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
      width: double.maxFinite,
      child: Card(
          child: InkWell(
        onTap: () => _onTap(context),
        child: Column(
          children: [
            CachedNetworkImage(
                imageUrl: newsIntro.image ?? '',
                height: 200.h,
                width: double.maxFinite,
                fit: BoxFit.fill,
                errorWidget: (ct, err, _) {
                  return const Center(
                    child: Icon(Icons.error),
                  );
                }),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 16.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (newsIntro.title != null)
                    Text(
                      newsIntro.title ?? '',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  SizedBox(
                    height: 8.h,
                  ),
                  if (newsIntro.sapo != null) Text(newsIntro.sapo ?? ''),
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}
