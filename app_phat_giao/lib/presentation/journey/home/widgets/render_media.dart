import 'package:app_phat_giao/commons/utils/utils.dart';
import 'package:app_phat_giao/data/model/news.dart';
import 'package:app_phat_giao/data/remote_source/news_data_remote_source.dart';
import 'package:app_phat_giao/presentation/app/styles/style.dart';
import 'package:app_phat_giao/presentation/components/future_handler/future_handler.dart';
import 'package:app_phat_giao/presentation/components/layouts/error_layout.dart';
import 'package:app_phat_giao/presentation/journey/news/detail_news/detail_news_page.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../data/model/category.dart';
import '../../news/news_list_by_category/news_list_by_category_page.dart';

class RenderMedia extends StatefulWidget {
  const RenderMedia({Key? key}) : super(key: key);

  @override
  State<RenderMedia> createState() => _RenderMediaState();
}

class _RenderMediaState extends State<RenderMedia> {
  final NewsDataRemoteSource _newsDataRemoteSource = Get.find();

  void _onTap(BuildContext context, NewsIntro newsIntro) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (_) => DetailNewsPage(
                  newsIntro: newsIntro,
                )));
  }

  void _navigatorToPictureCate() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (_) => NewsListByCategoryPage(
                  category: Category(
                    categoryName: 'Ảnh',
                    slug: 'anh',
                    categoryId: '13380',
                  ),
                )));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: mDarkPrimaryColor,
      padding: EdgeInsets.symmetric(vertical: 16.h),
      child: Column(
        children: [_renderTop(), _renderNews()],
      ),
    );
  }

  Widget _renderTop() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'MEDIA',
            style: Theme.of(context)
                .textTheme
                .displayMedium
                ?.copyWith(color: mPrimaryColor, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 16.h,
          ),
          Row(
            children: [
              TextButton(
                onPressed: _navigatorToPictureCate,
                style: TextButton.styleFrom(
                  primary: mWhite,
                  textStyle: TextStyle(fontSize: 18.sp),
                ),
                child: const Text(
                  'Ảnh',
                ),
              ),
              SizedBox(
                width: 16.w,
              ),
              TextButton(
                onPressed: () => Utils.openURL('https://tv.phatgiao.org.vn/'),
                style: TextButton.styleFrom(
                  primary: mWhite,
                  textStyle: TextStyle(fontSize: 18.sp),
                ),
                child: const Text(
                  'Phật giáo TV',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _renderNews() {
    return FutureRender<List<NewsIntro>>(
      future: _newsDataRemoteSource.getMediaNews(),
      resultWidget: (newsIntros) {
        return ListView.separated(
            itemCount: newsIntros.length,
            shrinkWrap: true,
            primary: false,
            separatorBuilder: (_, __) => SizedBox(
                  height: 24.h,
                ),
            itemBuilder: (ct, index) => index == 0
                ? _renderFirstNew(newsIntros[index])
                : _renderANew(
                    newsIntros[index],
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

  Widget _renderFirstNew(NewsIntro newsIntro) {
    return InkWell(
      onTap: () => _onTap(context, newsIntro),
      splashColor: mWhite,
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
            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (newsIntro.title != null)
                  Text(
                    newsIntro.title ?? '',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontSize: 24.sp,
                          color: mWhite,
                        ),
                  ),
                SizedBox(
                  height: 16.h,
                ),
                if (newsIntro.sapo != null)
                  Text(
                    newsIntro.sapo ?? '',
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(color: mWhite),
                  ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _renderANew(NewsIntro newsIntro) {
    return InkWell(
      onTap: () => _onTap(context, newsIntro),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.w),
        child: Row(
          children: [
            Expanded(
                child: CachedNetworkImage(
                    imageUrl: newsIntro.image ?? '',
                    height: 100.h,
                    width: 200.w,
                    fit: BoxFit.fill,
                    errorWidget: (ct, err, _) {
                      return const Center(
                        child: Icon(Icons.error),
                      );
                    })),
            SizedBox(
              width: 16.w,
            ),
            Expanded(
              child: Text(
                newsIntro.title ?? '',
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(color: mWhite, fontWeight: FontWeight.w600),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
