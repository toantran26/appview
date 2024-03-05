import 'package:app_phat_giao/data/model/category.dart';
import 'package:app_phat_giao/data/model/news.dart';
import 'package:app_phat_giao/data/model/tag.dart';
import 'package:app_phat_giao/data/remote_source/news_data_remote_source.dart';
import 'package:app_phat_giao/presentation/app/styles/style.dart';
import 'package:app_phat_giao/presentation/components/future_handler/future_handler.dart';
import 'package:app_phat_giao/presentation/components/items/news_intro_item.dart';
import 'package:app_phat_giao/presentation/components/items/news_intro_with_icon_item.dart';
import 'package:app_phat_giao/presentation/components/layouts/error_layout.dart';
import 'package:app_phat_giao/presentation/journey/home/widgets/most_read_news.dart';
import 'package:app_phat_giao/presentation/journey/home/widgets/selective_news.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../components/layouts/body_with_footer_layout.dart';

class NewsListByTrendingPage extends StatefulWidget {
  const NewsListByTrendingPage({Key? key, required this.trendingTag})
      : super(key: key);

  final TrendingTag trendingTag;

  @override
  State<NewsListByTrendingPage> createState() => _NewsListByTrendingPageState();
}

class _NewsListByTrendingPageState extends State<NewsListByTrendingPage> {
  final NewsDataRemoteSource _newsDataRemoteSource = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Trending: "${widget.trendingTag.title ?? ''}"',
          style:
              Theme.of(context).textTheme.titleSmall?.copyWith(color: mWhite),
        ),
        backgroundColor: mPrimaryColor,
        iconTheme: const IconThemeData(color: mWhite),
      ),
      body: FutureRender<List<NewsIntro>>(
        future: _newsDataRemoteSource
            .getNewsListByTrending(widget.trendingTag.trendId!),
        resultWidget: (newsIntros) {
          return _renderBody(newsIntros);
        },
        errorWidget: (error) {
          return ErrorLayout(
            onTryAgain: () {
              setState(() {});
            },
          );
        },
      ),
    );
  }

  Widget _renderBody(List<NewsIntro> newsIntros) {
    return BodyWithFooterLayout(
      showEvent: false,
      showDonate: false,
      padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 8.w),
      child: Column(
        children: [
          ListView.separated(
            itemCount: newsIntros.length,
            shrinkWrap: true,
            primary: false,
            itemBuilder: (ct, index) =>
                NewsIntroItem(newsIntro: newsIntros[index]),
            separatorBuilder: (BuildContext context, int index) => SizedBox(
              height: 16.h,
            ),
          ),
          SizedBox(
            height: 16.h,
          ),
          MostReadNews(),
          SizedBox(
            height: 16.h,
          ),
          SelectiveNews()
        ],
      ),
    );
  }
}
