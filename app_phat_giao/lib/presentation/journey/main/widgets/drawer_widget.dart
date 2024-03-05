import 'package:app_phat_giao/commons/constants/icon_constants.dart';
import 'package:app_phat_giao/data/model/category.dart';
import 'package:app_phat_giao/main.dart';
import 'package:app_phat_giao/presentation/app/styles/style.dart';
import 'package:app_phat_giao/presentation/components/about_us/about_us_content.dart';
import 'package:app_phat_giao/presentation/components/about_us/footer_note_content.dart';
import 'package:app_phat_giao/presentation/journey/news/news_list_by_category/news_list_by_category_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../commons/utils/utils.dart';
import '../../data/data_page.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({Key? key, required this.categories}) : super(key: key);

  final List<Category> categories;

  void _onTap(BuildContext context, Category category) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (_) => DataPage(
                  category: category,
                )));
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: mWhite,
      width: double.maxFinite,
      child: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Stack(
                children: [
                  Center(
                    child: SvgPicture.asset(IconConstants.logoPhatGiao,
                        fit: BoxFit.fitHeight, height: 32.h),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: Icon(
                          Icons.close,
                          color: Colors.black,
                        )),
                  )
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListView.separated(
                      primary: false,
                      shrinkWrap: true,
                      itemCount: categories.length,
                      itemBuilder: (ct, index) => (categories[index].children ==
                                  null ||
                              categories[index].children!.isEmpty)
                          ? ListTile(
                              title: Text(
                                categories[index]
                                    .categoryName
                                    .toString()
                                    .toUpperCase(),
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.copyWith(
                                        color: mBlackBody2,
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.bold),
                              ),
                              onTap: () => _onTap(context, categories[index]),
                            )
                          : ExpansionTile(
                              iconColor: mPrimaryColor,
                              title: InkWell(
                                onTap: () => _onTap(context, categories[index]),
                                child: Text(
                                  categories[index]
                                      .categoryName
                                      .toString()
                                      .toUpperCase(),
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.copyWith(
                                          color: mBlackBody2,
                                          fontSize: 15.sp,
                                          fontWeight: FontWeight.bold),
                                ),
                              ),
                              children: categories[index]
                                  .children!
                                  .map((e) => ListTile(
                                        title: Padding(
                                          padding: EdgeInsets.only(left: 8.0.w),
                                          child: Text(
                                            e.categoryName
                                                .toString()
                                                .toUpperCase(),
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyMedium
                                                ?.copyWith(
                                                    color: mBlackBody2,
                                                    fontSize: 12.sp),
                                          ),
                                        ),
                                        onTap: () => _onTap(context, e),
                                      ))
                                  .toList(),
                            ),
                      separatorBuilder: (_, __) => const Divider(),
                    ),
                    const Divider(),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 16.0.w, vertical: 16.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Đường dây nóng (Bấm để gọi)',
                            style: TextStyle(color: mGrayColor),
                          ),
                          SizedBox(
                            height: 8.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              _renderContactItem('Hà Nội:', '0338333422',
                                  () => Utils.callPhone('0338333422')),
                              _renderContactItem(
                                  'Email:',
                                  'info@phatgiao.org.vn',
                                  () => Utils.sendEmail('info@phatgiao.org.vn'))
                            ],
                          ),
                        ],
                      ),
                    ),
                    const Divider(),
                    const AboutUsContent(
                      bgColor: Colors.transparent,
                      showLogo: false,
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.w),
                      child: const FooterNoteContent(),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _renderContactItem(
      String title, String content, VoidCallback onPressed) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        InkWell(
          onTap: onPressed,
          child: Text(
            content,
            style: TextStyle(
                color: mPrimaryColor, decoration: TextDecoration.underline),
          ),
        )
      ],
    );
  }
}
