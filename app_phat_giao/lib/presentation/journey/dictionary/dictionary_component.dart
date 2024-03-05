import 'package:app_phat_giao/commons/utils/utils.dart';
import 'package:app_phat_giao/presentation/app/styles/style.dart';
import 'package:app_phat_giao/presentation/journey/home/widgets/most_date_news.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../commons/constants/image_constants.dart';
import '../../components/about_us/about_us_content.dart';
import '../../components/about_us/footer_note_content.dart';
import '../home/widgets/most_read_news.dart';
import 'dictionary_result_page.dart';

class DictionaryComponent extends StatefulWidget {
  const DictionaryComponent({Key? key}) : super(key: key);

  @override
  State<DictionaryComponent> createState() => _DictionaryComponentState();
}

class _DictionaryComponentState extends State<DictionaryComponent> {
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
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 16.h),
      child: Card(
        color: const Color(0xfff0eff4),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 8.w),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Từ điển Phật học',
                    style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                        color: mPrimaryColor),
                  ),
                ),
                SizedBox(
                  height: 16.h,
                ),
                Image.asset(ImageConstants.keNgang),
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
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 8.h, horizontal: 8.w),
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
      ),
    );
  }

  @override
  void dispose() {
    _searchCtrl.dispose();
    super.dispose();
  }
}
