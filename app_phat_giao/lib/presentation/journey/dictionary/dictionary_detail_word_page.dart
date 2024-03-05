import 'package:app_phat_giao/data/model/dictitionary.dart';
import 'package:app_phat_giao/presentation/app/styles/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DictionaryDetailWordPage extends StatelessWidget {
  const DictionaryDetailWordPage(
      {Key? key, required this.word, required this.suggestWords})
      : super(key: key);

  final DicritionaryWord word;
  final List<DicritionaryWord> suggestWords;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.close,
            size: 24,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text('Từ khóa: "${word.title ?? ''}"'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          vertical: 16.h,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 8.w,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                      text: TextSpan(
                          style: Theme.of(context).textTheme.bodyMedium,
                          text: 'Bạn đang tìm kiếm để hiểu ý nghĩa của từ khóa',
                          children: [
                        TextSpan(
                          text: ' "${word.title}"',
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: mPrimaryColor),
                        ),
                        const TextSpan(
                            text:
                                '. Ý nghĩa của từ Pa-cha-ri-pa theo Tự điển Phật học như sau:'),
                      ])),
                  SizedBox(
                    height: 16.h,
                  ),
                  RichText(
                      text: TextSpan(
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: mPrimaryColor),
                          text: '${word.title} ',
                          children: [
                        TextSpan(
                          text: 'có nghĩa là:',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ])),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Html(data: word.content),
            ),
            const Divider(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w),
              child: Column(
                children: [
                  RichText(
                      text: TextSpan(
                          style: Theme.of(context).textTheme.bodyMedium,
                          text: 'Trên đây là ý nghĩa của từ',
                          children: [
                        TextSpan(
                          text: ' "${word.title}"',
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: mPrimaryColor),
                        ),
                        const TextSpan(
                            text:
                                ' trong hệ thống Tự điển Phật học online do Cổng Thông tin Phật giáo Việt Nam cung cấp. Các từ khóa khác về Phật học trên hệ thống sẽ được tiếp tục cập nhật.'),
                      ])),
                  SizedBox(
                    height: 8.h,
                  ),
                  Text(
                      'Cảm ơn bạn đã truy cập Tự điển Phật học online trên trang nhà.'),
                ],
              ),
            ),
            if (suggestWords.isNotEmpty) _renderSuggestWords(context)
          ],
        ),
      ),
    );
  }

  Widget _renderSuggestWords(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      child: Column(
        children: [
          SizedBox(
            height: 8.h,
          ),
          const Text(
              'Bạn cũng có thể tìm hiểu thêm các từ khóa Phật học khác có cùng ký tự tương ứng trên Tự điển Phật học online:'),
          SizedBox(
            height: 16.h,
          ),
          ListView.separated(
              itemBuilder: (ct, i) => InkWell(
                    onTap: () => Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (_) => DictionaryDetailWordPage(
                                  word: suggestWords[i],
                                  suggestWords: suggestWords,
                                ))),
                    child: Text(
                      suggestWords[i].title ?? '',
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(color: mPrimaryColor),
                    ),
                  ),
              shrinkWrap: true,
              separatorBuilder: (_, __) => SizedBox(
                    height: 8.h,
                  ),
              itemCount: suggestWords.length)
        ],
      ),
    );
  }
}
