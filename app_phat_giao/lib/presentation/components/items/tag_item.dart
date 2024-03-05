import 'package:app_phat_giao/data/model/tag.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../journey/news/news_list_by_tag/news_list_by_tag.dart';

class TagItem extends StatelessWidget {
  const TagItem({Key? key, required this.newsTag}) : super(key: key);

  final NewsTag newsTag;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (_) => NewsListByTagPage(
                    newsTag: newsTag,
                  ))),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            border: Border.all(color: Colors.grey)),
        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
        child: Text(newsTag.tagTitle ?? ''),
      ),
    );
  }
}
