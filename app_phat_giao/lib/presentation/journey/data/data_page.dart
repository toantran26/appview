import 'package:app_phat_giao/commons/constants/icon_constants.dart';
import 'package:app_phat_giao/presentation/app/styles/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../data/model/category.dart';
import '../news/news_list_by_category/news_list_by_category_page.dart';
import '../search/search_page.dart';

class DataPage extends StatefulWidget {
  const DataPage({Key? key, required this.category}) : super(key: key);

  final Category category;

  @override
  State<DataPage> createState() => _DataPageState();
}

class _DataPageState extends State<DataPage> {
  late Category _categoryPicked;

  @override
  void initState() {
    _categoryPicked = widget.category;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final children = widget.category.children ?? [];

    print('>> category: ${widget.category.categoryName}');
    widget.category.children?.forEach((element) {
      print(element.categoryName);
    });

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: SvgPicture.asset(IconConstants.logoPhatGiao,
            fit: BoxFit.fitHeight, height: 32.h),
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
              onPressed: () => Navigator.push(context,
                  MaterialPageRoute(builder: (_) => const SearchPage())),
              icon: const Icon(
                Icons.search,
                size: 24,
              ))
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 32.h,
            color: mGrayLightColor,
            width: double.maxFinite,
            child: ListView.separated(
                padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemBuilder: (ct, i) => i == 0
                    ? Center(
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              _categoryPicked = widget.category;
                            });
                          },
                          child: FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Text(
                              widget.category.categoryName ?? '',
                              style: TextStyle(
                                  fontWeight: _categoryPicked.categoryId ==
                                          widget.category.categoryId
                                      ? FontWeight.bold
                                      : null),
                            ),
                          ),
                        ),
                      )
                    : Center(
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              _categoryPicked = children[i - 1];
                            });
                          },
                          child: FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Text(
                              children[i - 1].categoryName ?? '',
                              style: TextStyle(
                                  fontWeight: _categoryPicked.categoryId ==
                                          children[i - 1].categoryId
                                      ? FontWeight.bold
                                      : null),
                            ),
                          ),
                        ),
                      ),
                separatorBuilder: (_, index) => index == 0
                    ? Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Icon(
                            Icons.arrow_forward_ios,
                            size: 20.sp,
                          ),
                        ),
                      )
                    : index == children.length
                        ? const SizedBox()
                        : Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Container(
                              height: double.maxFinite,
                              color: Colors.grey,
                              width: 2,
                            ),
                          ),
                itemCount: children.length + 1),
          ),
          Expanded(
            child: NewsListByCategoryPage(
              category: _categoryPicked,
              showAppbar: false,
            ),
          )
        ],
      ),
    );
  }
}
