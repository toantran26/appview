import 'package:app_phat_giao/commons/utils/utils.dart';
import 'package:app_phat_giao/presentation/app/styles/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'widgets/search_result.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key, this.initial}) : super(key: key);

  final String? initial;

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final _resultKey = GlobalKey<ResultSearchState>();

  final _searchCtrl = TextEditingController();

  @override
  void initState() {
    super.initState();
    Utils.afterBuild((){
      if (widget.initial != null) {
        _searchCtrl.text = widget.initial!;
        _onSubmit(widget.initial!);
      }
    });
  }

  void _onSubmit(String? value) {
    if (value != null &&
        value.trim().isNotEmpty &&
        _resultKey.currentState != null) {
      _resultKey.currentState!.update(value);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            _renderSearchBox(),
            Expanded(
              child: ResultSearch(
                key: _resultKey,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _renderSearchBox() {
    return Container(
        color: mPrimaryColor,
        padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 8.w),
        child: Row(
          children: [
            IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(
                  Icons.close,
                  size: 32,
                  color: mWhite,
                )),
            SizedBox(
              width: 8.w,
            ),
            Expanded(
                child: TextFormField(
              controller: _searchCtrl,
              autofocus: widget.initial == null,
              onFieldSubmitted: _onSubmit,
              style: Theme.of(context).textTheme.bodyMedium,
              textInputAction: TextInputAction.search,
              decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
                  filled: true,
                  fillColor: mWhite,
                  suffixIcon: IconButton(
                    icon: Icon(
                      Icons.search,
                      size: 32,
                      color: mPrimaryColor,
                    ),
                    onPressed: () => _onSubmit(_searchCtrl.text),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(24.0),
                  ),
                  errorStyle: Theme.of(context)
                      .textTheme
                      .caption
                      ?.copyWith(color: mWhite),
                  hintText: 'Tìm kiếm'),
            )),
          ],
        ));
  }
}
