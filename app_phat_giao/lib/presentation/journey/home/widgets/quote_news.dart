import 'package:app_phat_giao/data/model/news.dart';
import 'package:app_phat_giao/data/remote_source/news_data_remote_source.dart';
import 'package:app_phat_giao/presentation/components/future_handler/future_handler.dart';
import 'package:app_phat_giao/presentation/components/items/quote_news_intro_item.dart';
import 'package:app_phat_giao/presentation/components/layouts/error_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class RenderQuoteNews extends StatefulWidget {
  const RenderQuoteNews({Key? key}) : super(key: key);

  @override
  State<RenderQuoteNews> createState() => _QuoteNewsState();
}

class _QuoteNewsState extends State<RenderQuoteNews> {
  final NewsDataRemoteSource _newsDataRemoteSource = Get.find();

  @override
  Widget build(BuildContext context) {
    return FutureRender<List<QuoteNews>>(
      future: _newsDataRemoteSource.getQuoteNews(),
      resultWidget: (newsIntros) {
        return ListView.separated(
            itemCount: newsIntros.length,
            shrinkWrap: true,
            primary: false,
            separatorBuilder: (_, __) => SizedBox(
                  height: 16.h,
                ),
            itemBuilder: (ct, index) => QuoteNewsIntroItem(
                  quoteNews: newsIntros[index],
                ));
      },
      errorWidget: (error) {
        return ErrorLayout(
          onTryAgain: () {
            setState(() {});
          },
        );
      },
    );
  }
}
