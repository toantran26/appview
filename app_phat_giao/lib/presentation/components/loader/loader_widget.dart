import 'package:app_phat_giao/presentation/app/styles/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoaderWidget extends StatelessWidget {
  const LoaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 25.w,
        width: 25.w,
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(mPrimaryColor),
        ),
      ),
    );
  }
}
