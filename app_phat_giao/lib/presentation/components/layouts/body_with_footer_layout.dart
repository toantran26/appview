import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../journey/dictionary/dictionary_component.dart';
import '../../journey/home/widgets/event_news.dart';
import '../about_us/about_us_content.dart';
import '../about_us/donate_content.dart';
import '../about_us/footer_category.dart';
import '../about_us/footer_note_content.dart';

class BodyWithFooterLayout extends StatelessWidget {
  const BodyWithFooterLayout(
      {Key? key,
      required this.child,
      this.padding,
      this.showDonate = true,
      this.showEvent = true})
      : super(key: key);

  final Widget child;
  final EdgeInsets? padding;
  final bool showEvent, showDonate;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: padding,
      child: Column(
        children: [
          child,
          if (showEvent) const EventNews(),
          const DictionaryComponent(),
          SizedBox(
            height: 8.h,
          ),
          if (showDonate) const DonateContent(),
          const AboutUsContent(
            bgColor: Colors.transparent,
          ),
          const Padding(
            padding: EdgeInsets.all(8),
            child: FooterCategory(),
          ),
          SizedBox(
            height: 16.h,
          ),
          const FooterNoteContent()
        ],
      ),
    );
  }
}
