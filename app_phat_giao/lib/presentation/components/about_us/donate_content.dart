import 'package:app_phat_giao/commons/constants/image_constants.dart';
import 'package:app_phat_giao/presentation/app/styles/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DonateContent extends StatelessWidget {
  const DonateContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: mYellowColor,
      padding: EdgeInsets.symmetric(
        vertical: 16.h,
        horizontal: 16.w,
      ),
      child: Column(
        children: [
          Text(
            'HỖ TRỢ CHÚNG TÔI',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 8.h,
          ),
          RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                  text:
                      'Tuân theo truyền thống Phật giáo, chúng tôi cung cấp tài liệu giáo dục Phật giáo phi lợi nhuận. Khả năng duy trì và mở rộng dự án của chúng tôi hoàn toàn phụ thuộc vào sự hỗ trợ của bạn. Nếu thấy tài liệu của chúng tôi hữu ích, hãy cân nhắc quyên góp',
                  style: TextStyle(fontSize: 14.sp, color: mDarkColor),
                  children: [
                    TextSpan(
                        text: ' một lần ',
                        style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.bold,
                            color: mDarkColor)),
                    TextSpan(
                        text: ' hoặc ',
                        style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.normal,
                            color: mDarkColor)),
                    TextSpan(
                        text: 'hàng tháng.',
                        style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.bold,
                            color: mDarkColor))
                  ])),
          SizedBox(
            height: 8.h,
          ),
          Container(
            color: const Color.fromRGBO(255, 255, 255, .4),
            padding: EdgeInsets.symmetric(vertical: 16.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  ImageConstants.donateQR,
                  width: 120.w,
                  height: 120.h,
                ),
                SizedBox(
                  height: 8.h,
                ),
                Text(
                  'STK: 117 002 777 568',
                  style: TextStyle(
                    fontSize: 14.sp,
                  ),
                ),
                Text('Ngân hàng Công thương Việt Nam',
                    style: TextStyle(
                      fontSize: 14.sp,
                    )),
                Text(
                    '(Nội dung: Họ tên + Hỗ trợ Cổng thông tin Phật giáo Việt Nam)',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14.sp,
                    ))
              ],
            ),
          ),
          SizedBox(
            height: 8.h,
          ),
          Text(
            '“Chúng tôi tin rằng sự tài trợ của các bạn không chỉ giúp chúng tôi làm tốt phận sự của mình mà còn gia tăng mãnh liệt năng lượng sự thiện tâm của chính bạn tới cộng đồng”\n(Cư sĩ Thiện Đức, Trưởng Ban Biên tập).',
            style: TextStyle(fontSize: 14.sp),
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
