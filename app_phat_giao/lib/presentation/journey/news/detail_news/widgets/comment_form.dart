import 'package:app_phat_giao/data/model/comment.dart';
import 'package:app_phat_giao/data/remote_source/news_data_remote_source.dart';
import 'package:app_phat_giao/presentation/app/styles/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../components/loader/loader_dialog.dart';

class CommentForm extends StatefulWidget {
  const CommentForm({Key? key, required this.newsId}) : super(key: key);

  final String newsId;

  @override
  State<CommentForm> createState() => _CommentFormState();
}

class _CommentFormState extends State<CommentForm> {
  final _nameCtrl = TextEditingController();
  final _phoneCtrl = TextEditingController();
  final _emailCtrl = TextEditingController();
  final _cmtCtrl = TextEditingController();

  void _submit() async {
    final name = _nameCtrl.text;
    final phone = _phoneCtrl.text;
    final email = _emailCtrl.text;
    final cmt = _cmtCtrl.text;

    if (name.isEmpty || phone.isEmpty || email.isEmpty || cmt.isEmpty) {
      showDialog(
          context: context,
          builder: (ct) => AlertDialog(
                content: Text(
                  'Vui lòng nhập đầy đủ thông tin',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                actions: [
                  ElevatedButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text('OK'),
                  )
                ],
              ));
      return;
    }

    try {
      LoaderDialog.show(context);
      final newsSource = Get.find<NewsDataRemoteSource>();

      await newsSource.commentInNews(
          widget.newsId,
          CommentRequest(
              fullname: _nameCtrl.text,
              email: _emailCtrl.text,
              comment: _cmtCtrl.text,
              phone: _phoneCtrl.text));

      if (!mounted) return;

      LoaderDialog.pop(context);
      Get.snackbar('Thành công', "Đã gửi bình luận",
          backgroundColor: Colors.green, colorText: mWhite);
    } catch (e) {
      LoaderDialog.pop(context);
      showDialog(
          context: context,
          builder: (ct) => AlertDialog(
                content: Text(
                  'Đã có lỗi xảy ra. Vui lòng thử lại!',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                actions: [
                  ElevatedButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text('OK'),
                  )
                ],
              ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: mWhite,
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 16.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Ý kiến của bạn',
            style: Theme.of(context)
                .textTheme
                .titleMedium
                ?.copyWith(color: mPrimaryColor),
          ),
          SizedBox(
            height: 16.h,
          ),
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: _nameCtrl,
                  keyboardType: TextInputType.name,
                  style: Theme.of(context).textTheme.bodyMedium,
                  decoration: InputDecoration(
                      hintText: 'Họ và tên',
                      border: const OutlineInputBorder(),
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 4.w, horizontal: 8.h)),
                ),
              ),
              SizedBox(
                width: 8.w,
              ),
              Expanded(
                child: TextFormField(
                  controller: _phoneCtrl,
                  keyboardType: TextInputType.phone,
                  style: Theme.of(context).textTheme.bodyMedium,
                  decoration: InputDecoration(
                      hintText: 'Số điện thoại',
                      border: const OutlineInputBorder(),
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 4.w, horizontal: 8.h)),
                ),
              )
            ],
          ),
          SizedBox(
            height: 8.h,
          ),
          Row(
            children: [
              const Text('Hoặc'),
              SizedBox(
                width: 8.w,
              ),
              Expanded(
                child: TextFormField(
                  controller: _emailCtrl,
                  keyboardType: TextInputType.emailAddress,
                  style: Theme.of(context).textTheme.bodyMedium,
                  decoration: InputDecoration(
                      hintText: 'Email',
                      border: const OutlineInputBorder(),
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 4.w, horizontal: 8.h)),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 8.h,
          ),
          TextFormField(
            controller: _cmtCtrl,
            keyboardType: TextInputType.multiline,
            style: Theme.of(context).textTheme.bodyMedium,
            maxLines: null,
            decoration: InputDecoration(
                hintText: 'Nhập nội dung...',
                border: const OutlineInputBorder(),
                contentPadding:
                    EdgeInsets.symmetric(vertical: 4.w, horizontal: 8.h)),
          ),
          SizedBox(
            height: 8.h,
          ),
          ElevatedButton(
            onPressed: _submit,
            child: const Text('Gửi bình luận'),
            style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    _nameCtrl.dispose();
    _phoneCtrl.dispose();
    _emailCtrl.dispose();
    _cmtCtrl.dispose();
    super.dispose();
  }
}
