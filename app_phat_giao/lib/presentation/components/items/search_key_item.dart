import 'package:app_phat_giao/data/model/search_key.dart';
import 'package:app_phat_giao/presentation/app/styles/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchKeyItem extends StatelessWidget {
  const SearchKeyItem(
      {Key? key, required this.searchKey, required this.onPressed})
      : super(key: key);

  final SearchKey searchKey;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black, width: 2),
            borderRadius: BorderRadius.circular(30)),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.search,
              size: 28,
            ),
            SizedBox(
              width: 8.w,
            ),
            Text(
              searchKey.title ?? '',
              style: Theme.of(context).textTheme.caption?.copyWith(
                  color: const Color(0xff333333), fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
