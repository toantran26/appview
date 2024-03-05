import 'package:app_phat_giao/commons/constants/image_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../commons/utils/utils.dart';

class FooterNoteContent extends StatelessWidget {
  const FooterNoteContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final style = TextStyle(fontSize: 11.sp);

    return Column(
      children: [
        Text(
          'Mọi sự copy, sao chép từ Phatgiao.org.vn đều không cần trích dẫn và được hoan nghênh!',
          style: style,
          textAlign: TextAlign.center,
        ),
        InkWell(
          onTap: () => Utils.openURL('https://vbmedia.org/'),
          child: Text(
            '@Phát triển và vận hành bởi VBmedia.org',
            style: style,
          ),
        ),
        SizedBox(
          height: 8.h,
        ),
        InkWell(
          onTap:() => Utils.openURL('https://www.dmca.com/Protection/Status.aspx?id=854cb829-e367-465f-8beb-7544a4a9947c&cdnrdr=1&refurl=https://phatgiao.org.vn/'),
          child: Image.asset(
            ImageConstants.dmcaProtected,
            height: 24.h,
            fit: BoxFit.fitHeight,
          ),
        )
      ],
    );
  }
}
