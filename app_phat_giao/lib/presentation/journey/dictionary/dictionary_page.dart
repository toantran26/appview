import 'package:app_phat_giao/commons/utils/utils.dart';
import 'package:app_phat_giao/presentation/app/styles/style.dart';
import 'package:app_phat_giao/presentation/journey/home/widgets/most_date_news.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../components/about_us/about_us_content.dart';
import '../../components/about_us/footer_note_content.dart';
import '../home/widgets/most_read_news.dart';
import 'dictionary_result_page.dart';

class DictionaryPage extends StatefulWidget {
  const DictionaryPage({Key? key}) : super(key: key);

  @override
  State<DictionaryPage> createState() => _DictionaryPageState();
}

class _DictionaryPageState extends State<DictionaryPage> {
  final _formKey = GlobalKey<FormState>();
  final _searchCtrl = TextEditingController();

  void _onSubmit(String? value) {
    if (value != null && value.trim().isNotEmpty) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (_) => DictionaryResultPage(
                    value: value,
                  )));
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
            color: mPrimaryColor,
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Text(
                    'TỪ ĐIỂN PHẬT HỌC ONLINE',
                    style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                        color: mWhite),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  Text(
                    'Từ điển Phật học được sắp xếp\ntheo thứ tự từ A đến Z',
                    style: TextStyle(fontSize: 14.sp, color: mWhite),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  TextFormField(
                    controller: _searchCtrl,
                    textInputAction: TextInputAction.search,
                    style: Theme.of(context).textTheme.bodyMedium,
                    onFieldSubmitted: _onSubmit,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Bạn chưa nhập từ khóa';
                      }

                      return null;
                    },
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: mWhite,
                        suffixIcon: IconButton(
                          icon: Icon(
                            Icons.close,
                            size: 28,
                            color: mPrimaryColor,
                          ),
                          onPressed: () => _searchCtrl.clear(),
                        ),
                        border: const OutlineInputBorder(),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: mDarkPrimaryColor),
                        ),
                        errorStyle: Theme.of(context)
                            .textTheme
                            .caption
                            ?.copyWith(color: mWhite),
                        hintText: 'Nhập từ khóa tìm kiếm'),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      if (_formKey.currentState != null &&
                          _formKey.currentState!.validate()) {
                        _onSubmit(_searchCtrl.text.trim());
                      }
                    },
                    label: const Text('Tìm kiếm'),
                    icon: const Icon(
                      Icons.search,
                      size: 32,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 16.h,
          ),
          _renderIntroduction()
        ],
      ),
    );
  }

  Widget _renderIntroduction() {
    final contentStyle = TextStyle(fontSize: 14.sp);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.0.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Text(
              'LỜI GIỚI THIỆU',
              style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 16.h,
          ),
          Text(
            'Từ điển Phật học online này rất tiện lợi cho việc tra cứu, muốn tìm từ nào các bạn chỉ cần gõ từ đó vào ô "Nhập từ khóa tìm kiếm" và nhấn "Tìm kiếm", chỉ cần 1 giây, "từ khóa" mà các bạn muốn tìm kiếm lập tức sẽ hiện ra.',
            style: contentStyle,
          ),
          SizedBox(
            height: 8.h,
          ),
          Text(
            'Từ điển Phật học online cung cấp trên trang nhà là kết quả tổng hợp và xử lý dữ liệu bởi một chương trình máy tính với nhiều bộ Từ điển Phật học  đang lưu hành hiện nay như: Từ điển Phật Quang, Phật Quang Đại từ điển Hán ngữ, Từ điển Đạo Uyển, Từ điển Phật học Tinh tuyển, Từ điển Phật học Anh-Hán-Việt, Từ điển Phật học Việt-Anh (các tự điển), Ngữ vựng Danh từ Thiền học....',
            style: contentStyle,
          ),
          SizedBox(
            height: 8.h,
          ),
          Text(
            'Thành kính tri ân chư tôn đức tăng ni và các học giả đã dày công nghiên cứu, biên soạn và phát hành những bộ Từ điển Phật học cúng dường Tam Bảo, tạo công đức vô lượng.',
            style: contentStyle,
          ),
          SizedBox(
            height: 8.h,
          ),
          Text(
            'Do được xử lý bởi sức mọn và tài hèn của một nhóm biên tập viên và một chương trình máy tính chưa hoàn hảo, nên trong quá trình tra cứu, nếu phát hiện dữ liệu trang nhà có những sai sót, Ban Biên tập rất mong quý tăng ni Phật tử và người mộ đạo Phật phê bình, đóng góp ý kiến qua mail: info@phatgiao.org.vn để chúng tôi sám hối, sửa chữa.',
            style: contentStyle,
          ),
          SizedBox(
            height: 8.h,
          ),
          Text(
            'Mô Phật.',
            style: contentStyle,
          ),
          SizedBox(
            height: 8.h,
          ),
          RichText(
              text: TextSpan(
                  style: contentStyle.copyWith(color: mBlackBody2),
                  text: 'Cổng thông tin Phật giáo Việt Nam',
                  children: [
                TextSpan(
                  text: ' - www.phatgiao.org.vn',
                  style: contentStyle.copyWith(color: mPrimaryColor),
                  recognizer: TapGestureRecognizer()
                    ..onTap =
                        () => Utils.openURL('https://www.phatgiao.org.vn'),
                )
              ])),
          SizedBox(
            height: 16.h,
          ),
          const MostDateNews(),
          SizedBox(
            height: 16.h,
          ),
          const MostReadNews(),
          SizedBox(
            height: 16.h,
          ),
          const AboutUsContent(),
          SizedBox(
            height: 8.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            child: const FooterNoteContent(),
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    _searchCtrl.dispose();
    super.dispose();
  }
}
