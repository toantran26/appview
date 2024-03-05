import 'package:app_phat_giao/data/model/news.dart';
import 'package:app_phat_giao/presentation/app/styles/style.dart';
import 'package:app_phat_giao/presentation/journey/news/detail_news/detail_news_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RelationNewsIntroItem extends StatelessWidget {
  const RelationNewsIntroItem({Key? key, required this.newsIntro})
      : super(key: key);

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
      child: Row(
        children: [
          Container(
            width: 8,
            height: 8,
            color: const Color(0xffc4c4c4),
          ),
          SizedBox(
            width: 16.w,
          ),
          Expanded(
            child: Text(
              newsIntro.title.toString(),
              style: Theme.of(context).textTheme.caption,
            ),
          )
        ],
      ),
    );
  }
}
