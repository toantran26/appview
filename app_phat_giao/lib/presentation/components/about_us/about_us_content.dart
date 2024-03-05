import 'package:app_phat_giao/commons/constants/icon_constants.dart';
import 'package:app_phat_giao/presentation/app/styles/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AboutUsContent extends StatelessWidget {
  const AboutUsContent({Key? key, this.bgColor, this.showLogo = true})
      : super(key: key);

  final Color? bgColor;
  final bool showLogo;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      color: bgColor ?? mGrayLightColor,
      padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
      child: Column(
        children: [
          if (showLogo)
            SvgPicture.asset(IconConstants.logoPhatGiao,
                fit: BoxFit.fitHeight, height: 32.h),
          if (showLogo)
            SizedBox(
              height: 16.h,
            ),
          _renderContent()
        ],
      ),
    );
  }

  Widget _renderContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Cổng thông tin Phật giáo thuộc Giáo hội Phật giáo Việt Nam',
          style: TextStyle(
              fontSize: 14.sp, fontWeight: FontWeight.bold, color: mDarkColor),
        ),
        _renderTitleContentBold(
            'Chủ quản:', 'Ban Thông tin Truyền thông Trung ương'),
        _renderNormalContent(
            'Giấy phép số 09/GP-TTĐT cấp ngày 04/04/2014 của Bộ TT&TT'),
        _renderTitleContentBold(
            'Chịu trách nhiệm nội dung:', 'Hoà thượng. TS Thích Gia Quang'),
        _renderNormalContent(
            'Trưởng Ban Biên tập: Thiện Đức (thienduc@phatgiao.org.vn)'),
        _renderNormalContent(
            'Kênh truyền hình Phật giáo: https://tv.phatgiao.org.vn'),
        _renderTitleBoldContent('Trụ sở:',
            'P. 1702, Tòa nhà Comatce Tower, Số 61 Ngụy Như Kon Tum, P. Nhân Chính, Q. Thanh Xuân, Tp. Hà Nội.'),
        _renderTitleBoldContent('Văn phòng TW Giáo hội PGVN:',
            'P216 Chùa Quán Sứ, 73 Quán Sứ, Hoàn Kiếm, Hà Nội'),
        _renderTitleBoldContent('Văn phòng đại diện phía Nam:',
            'Văn phòng 2 TƯ Giáo hội PGVN, Thiền viện Quảng Đức, số 294 Nam Kỳ Khởi Nghĩa, Q3, TP. HCM'),
        _renderTitleBoldContent(
            'Hotline:', '0338333422 | Email: info@phatgiao.org.vn'),
      ],
    );
  }

  Widget _renderNormalContent(String content) {
    return Text(content,
        style: TextStyle(
          fontSize: 14.sp,
        ));
  }

  Widget _renderTitleBoldContent(String title, String content) {
    return RichText(
        text: TextSpan(
            text: '$title ',
            style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.bold,
                color: mDarkColor),
            children: [
          TextSpan(
              text: content,
              style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.normal,
                  color: mDarkColor))
        ]));
  }

  Widget _renderTitleContentBold(String title, String content) {
    return RichText(
        text: TextSpan(
            text: '$title ',
            style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.normal,
                color: mDarkColor),
            children: [
          TextSpan(
              text: content,
              style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold,
                  color: mDarkColor))
        ]));
  }
}
