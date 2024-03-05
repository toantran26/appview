import 'package:app_phat_giao/data/model/search_key.dart';
import 'package:app_phat_giao/data/remote_source/tag_remote_source.dart';
import 'package:app_phat_giao/presentation/components/future_handler/future_handler.dart';
import 'package:app_phat_giao/presentation/components/items/search_key_item.dart';
import 'package:app_phat_giao/presentation/components/layouts/error_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../app/styles/style.dart';
import '../../search/search_page.dart';

class RenderPopulationSearchKey extends StatefulWidget {
  const RenderPopulationSearchKey({Key? key}) : super(key: key);

  @override
  State<RenderPopulationSearchKey> createState() =>
      _RenderPopulationSearchKeyState();
}

class _RenderPopulationSearchKeyState extends State<RenderPopulationSearchKey> {
  final TagRemoteSource _tagRemoteSource = Get.find();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Tìm kiếm phổ biến',
          style: Theme.of(context)
              .textTheme
              .titleMedium
              ?.copyWith(color: mPrimaryColor),
        ),
        SizedBox(
          height: 8.h,
        ),
        FutureRender<List<SearchKey>>(
          future: _tagRemoteSource.getSearchKeyPopulation(),
          resultWidget: (searchKeys) {
            return Wrap(
              runSpacing: 8.h,
              spacing: 8.w,
              children: searchKeys
                  .map((e) => SearchKeyItem(
                        searchKey: e,
                        onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => SearchPage(
                                      initial: e.title,
                                    ))),
                      ))
                  .toList(),
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
    );
  }
}
