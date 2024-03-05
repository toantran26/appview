import 'package:app_phat_giao/data/model/news.dart';
import 'package:app_phat_giao/presentation/components/future_handler/future_handler.dart';
import 'package:app_phat_giao/presentation/components/layouts/error_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../data/remote_source/news_data_remote_source.dart';
import '../../../components/items/news_intro_item.dart';

class ResultSearch extends StatefulWidget {
  const ResultSearch({Key? key}) : super(key: key);

  @override
  State<ResultSearch> createState() => ResultSearchState();
}

class ResultSearchState extends State<ResultSearch> {
  final NewsDataRemoteSource _newsDataRemoteSource = Get.find();

  String? _value;

  void update(String value) {
    setState(() {
      _value = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_value == null) {
      return const Center(
        child: Text('Vui lòng nhập từ khóa tìm kiếm...'),
      );
    }

    return FutureRender<List<NewsIntro>>(
      future: _newsDataRemoteSource.searchByWord(_value!, '1'),
      resultWidget: (newsIntros) {
        if (newsIntros.isEmpty) {
          return const Expanded(
            child: Center(
              child: Text('Không tìm thấy bài viết nào.'),
            ),
          );
        }

        return SingleChildScrollView(
          padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 8.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Tìm kiếm: "${_value}"'),
              Text('Kết quả phù hợp'),
              const Divider(),
              ListView.builder(
                  itemCount: newsIntros.length,
                  shrinkWrap: true,
                  primary: false,
                  itemBuilder: (ct, index) => NewsIntroItem(
                        newsIntro: newsIntros[index],
                      ))
            ],
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
    );
  }
}
