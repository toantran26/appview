import 'package:app_phat_giao/commons/constants/image_constants.dart';
import 'package:app_phat_giao/data/model/news.dart';
import 'package:app_phat_giao/presentation/app/styles/style.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../journey/news/detail_news/detail_news_page_by_id.dart';

class QuoteNewsIntroItem extends StatelessWidget {
  const QuoteNewsIntroItem({Key? key, required this.quoteNews})
      : super(key: key);

  final QuoteNews quoteNews;

  void _onTap(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (_) => DetailNewsPageByID(
                  newsID: quoteNews.newsId!,
                )));
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: mBrownBackground,
      child: Stack(
        children: [
          Image.asset(ImageConstants.senBackground),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                SizedBox(height: 16.h),
                CachedNetworkImage(
                  imageUrl: quoteNews.image ?? '',
                  imageBuilder: (context, imageProvider) => Container(
                    width: 120.w,
                    height: 120.w,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(28)),
                      image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 16.h),
                Text(
                  quoteNews.name ?? '',
                  style:
                      TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w600),
                ),
                Text(
                  quoteNews.pre ?? '',
                  style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w600,
                      color: mGrayColor),
                ),
                SizedBox(height: 8.h),
                Text(
                  quoteNews.letter ?? '',
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 8.h),
                Text(
                  '"${quoteNews.content ?? ''}"',
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 16.h),
                ElevatedButton(
                    onPressed: () => _onTap(context),
                    child: const Text('Chi tiết'))
              ],
            ),
          )
        ],
      ),
    );
  }
}
