import 'package:app_phat_giao/presentation/app/styles/style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/model/category.dart';
import '../../../data/remote_source/master_data_remote_source.dart';
import '../../journey/data/data_page.dart';
import '../future_handler/future_handler.dart';
import '../layouts/error_layout.dart';

class FooterCategory extends StatefulWidget {
  const FooterCategory({Key? key}) : super(key: key);

  @override
  State<FooterCategory> createState() => _FooterCategoryState();
}

class _FooterCategoryState extends State<FooterCategory> {
  final MasterDataRemoteSource _masterSource = Get.find();

  @override
  Widget build(BuildContext context) {
    return FutureRender<List<Category>>(
        future: _masterSource.getCategoriesMenu(),
        errorWidget: (error) {
          return ErrorLayout(
            onTryAgain: () {
              setState(() {});
            },
          );
        },
        resultWidget: (categories) {
          return _renderBody(categories);
        });
  }

  Widget _renderBody(List<Category> categories) {
    final size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - kToolbarHeight - 24) / 12;
    final double itemWidth = size.width / 2;

    return Column(
      children: [
        const Divider(),
        MediaQuery.removePadding(
          context: context,
          removeTop: true,
          child: GridView.builder(
              shrinkWrap: true,
              primary: false,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 4,
                mainAxisSpacing: 4,
                childAspectRatio: (itemWidth / itemHeight),
              ),
              itemCount: categories.length,
              itemBuilder: (BuildContext context, int index) {
                return FittedBox(
                  fit: BoxFit.scaleDown,
                  alignment: Alignment.centerLeft,
                  child: InkWell(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => DataPage(
                                    category: categories[index],
                                  ))),
                      child: Text(
                        '${categories[index].categoryName?.toUpperCase()}',
                        style: TextStyle(
                            fontWeight: FontWeight.w600, color: mGrayDarkColor),
                        textAlign: TextAlign.left,
                      )),
                );
              }),
        ),
      ],
    );
  }
}
