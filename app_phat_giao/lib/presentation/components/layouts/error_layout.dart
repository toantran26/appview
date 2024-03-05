import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ErrorLayout extends StatelessWidget {
  const ErrorLayout({Key? key, required this.onTryAgain}) : super(key: key);

  final VoidCallback onTryAgain;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 8.h,
          ),
          const Text('Đã xảy ra lỗi. Vui lòng thử lại!'),
          SizedBox(
            height: 8.h,
          ),
          ElevatedButton.icon(
            onPressed: onTryAgain,
            icon: const Icon(Icons.circle_notifications),
            label: const Text('Thử lại'),
          ),
          SizedBox(
            height: 8.h,
          ),
        ],
      ),
    ));
  }
}
