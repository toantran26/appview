import 'package:app_phat_giao/data/model/detail_news.dart';
import 'package:app_phat_giao/data/remote_source/news_data_remote_source.dart';
import 'package:app_phat_giao/presentation/components/future_handler/future_handler.dart';
import 'package:app_phat_giao/presentation/components/layouts/error_layout.dart';
import 'package:app_phat_giao/presentation/journey/news/detail_news/detail_news_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class DetailNewsPageByID extends StatefulWidget {
  const DetailNewsPageByID({Key? key, required this.newsID}) : super(key: key);

  final String newsID;

  @override
  State<DetailNewsPageByID> createState() => _DetailNewsPageByIDState();
}

class _DetailNewsPageByIDState extends State<DetailNewsPageByID> {
  final NewsDataRemoteSource _newsDataRemoteSource = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureRender<List<DetailNews>>(
        future: _newsDataRemoteSource.getDetailNews(widget.newsID),
        resultWidget: (newsDetail) {
          return DetailNewsPage(detailNews: newsDetail[0]);
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
}
