import 'package:app_phat_giao/data/model/dictitionary.dart';
import 'package:app_phat_giao/data/remote_source/dictionary_data_remote_source.dart';
import 'package:app_phat_giao/presentation/app/styles/style.dart';
import 'package:app_phat_giao/presentation/components/future_handler/future_handler.dart';
import 'package:app_phat_giao/presentation/components/layouts/error_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'dictionary_detail_word_page.dart';

class DictionaryResultPage extends StatefulWidget {
  const DictionaryResultPage({Key? key, required this.value}) : super(key: key);

  final String value;

  @override
  State<DictionaryResultPage> createState() => _DictionaryResultPageState();
}

class _DictionaryResultPageState extends State<DictionaryResultPage> {
  final DictionaryRemoteSource _dictionaryRemoteSource = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Từ khóa tìm kiếm: "${widget.value}"'),
      ),
      body: FutureRender<List<DicritionaryWord>>(
        future: _dictionaryRemoteSource.searchWordInDictionary(widget.value),
        resultWidget: (results) {
          if (results.isEmpty) return _renderEmpty();
          return _renderBody(results);
        },
        errorWidget: (error) {
          return ErrorLayout(
            onTryAgain: () {
              setState(() {});
            },
          );
        },
      ),
    );
  }

  Widget _renderBody(List<DicritionaryWord> results) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
      child: Column(
        children: [
          RichText(
              text: TextSpan(
                  style: Theme.of(context).textTheme.bodyMedium,
                  text: 'Quý đạo hữu, Phật tử muốn tìm kiếm từ khóa',
                  children: [
                TextSpan(
                  text: ' "${widget.value}" ',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.bold, color: mPrimaryColor),
                ),
                TextSpan(text: 'trong ý nghĩa nào sau đây:'),
              ])),
          SizedBox(
            height: 16.h,
          ),
          ListView.separated(
              shrinkWrap: true,
              primary: false,
              itemBuilder: (ct, i) => _wordItem(results[i], results),
              separatorBuilder: (_, __) => SizedBox(
                    height: 8.h,
                  ),
              itemCount: results.length),
          SizedBox(
            height: 16.h,
          ),
          RichText(
              text: TextSpan(
                  style: Theme.of(context).textTheme.bodyMedium,
                  text:
                      'Xin vui lòng click vào đường dẫn để hiểu được ý nghĩa của từ',
                  children: [
                TextSpan(
                  text: ' "${widget.value}" ',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.bold, color: mPrimaryColor),
                ),
                const TextSpan(text: 'mà bạn đang tìm kiếm.'),
              ]))
        ],
      ),
    );
  }

  Widget _wordItem(DicritionaryWord word, List<DicritionaryWord> results) {
    return InkWell(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (_) => DictionaryDetailWordPage(
                    word: word,
                    suggestWords: results,
                  ))),
      child: Row(
        children: [
          Container(
            width: 14,
            height: 14,
            decoration: BoxDecoration(
                color: mDarkPrimaryColor,
                borderRadius: BorderRadius.circular(25)),
          ),
          SizedBox(
            width: 16.w,
          ),
          Text(
            word.title ?? '',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.bold, color: mDarkPrimaryColor),
          )
        ],
      ),
    );
  }

  Widget _renderEmpty() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
      child: Column(
        children: [
          const Text(
              'Xin lỗi bạn, không có từ này trong tự điển Phật học online. Chúng tôi sẽ cập nhật trong thời gian sớm nhất'),
          SizedBox(
            height: 8.h,
          ),
          const Text(
              'Cảm ơn bạn đã truy cập Tự điển Phật học online trên trang nhà.'),
          SizedBox(
            height: 8.h,
          ),
          const Text(
              'Bạn cũng có thể tìm hiểu thêm các từ khóa Phật học khác có cùng ký tự tương ứng trên Tự điển Phật học online')
        ],
      ),
    );
  }
}
