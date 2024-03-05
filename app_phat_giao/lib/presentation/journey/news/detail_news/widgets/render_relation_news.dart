import 'package:app_phat_giao/data/model/news.dart';
import 'package:app_phat_giao/data/remote_source/news_data_remote_source.dart';
import 'package:app_phat_giao/presentation/app/styles/style.dart';
import 'package:app_phat_giao/presentation/components/future_handler/future_handler.dart';
import 'package:app_phat_giao/presentation/components/items/news_intro_with_icon_item.dart';
import 'package:app_phat_giao/presentation/components/items/relation_news_intro_item.dart';
import 'package:app_phat_giao/presentation/components/layouts/error_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class RenderRelationNews extends StatefulWidget {
  const RenderRelationNews({Key? key, required this.newsId}) : super(key: key);

  final String newsId;

  @override
  State<RenderRelationNews> createState() => _RenderRelationNewsState();
}

class _RenderRelationNewsState extends State<RenderRelationNews> {
  final NewsDataRemoteSource _newsDataRemoteSource = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      color: mGrayLightColor,
      padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'TIN LIÊN QUAN',
            style: Theme.of(context).textTheme.titleSmall,
          ),
          SizedBox(
            height: 16.h,
          ),
          FutureRender<List<NewsIntro>>(
            future:
                _newsDataRemoteSource.getRelationNewsByNewsId(widget.newsId),
            resultWidget: (newsIntros) {
              return ListView.separated(
                itemCount: newsIntros.length > 4 ? 4 : newsIntros.length,
                shrinkWrap: true,
                primary: false,
                itemBuilder: (ct, index) => RelationNewsIntroItem(
                  newsIntro: newsIntros[index],
                ),
                separatorBuilder: (BuildContext context, int index) => SizedBox(
                  height: 16.h,
                ),
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
