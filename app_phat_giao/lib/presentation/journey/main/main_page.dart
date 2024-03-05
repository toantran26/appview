import 'package:app_phat_giao/commons/constants/gif_constants.dart';
import 'package:app_phat_giao/commons/constants/icon_constants.dart';
import 'package:app_phat_giao/data/model/category.dart';
import 'package:app_phat_giao/presentation/journey/dictionary/dictionary_page.dart';
import 'package:app_phat_giao/presentation/journey/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../about_us/about_us_page.dart';
import '../data/data_page.dart';
import '../search/search_page.dart';
import '__mocks__/data_category_mocks.dart';
import 'widgets/drawer_widget.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key, required this.categories}) : super(key: key);

  final List<Category> categories;

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  late Size _size;
  int _pageIndex = 0;

  void _onBottomBarTap(int i) {
    final double itemHeight = (_size.height - kToolbarHeight - 24) / 12;
    final double itemWidth = _size.width / 4;

    if (i == 2) {
      Get.bottomSheet(Container(
        padding: const EdgeInsets.all(16),
        color: Colors.white,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Dữ liệu',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(
              height: 16,
            ),
            MediaQuery.removePadding(
              context: context,
              removeTop: true,
              child: GridView.builder(
                  shrinkWrap: true,
                  primary: false,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 4,
                    mainAxisSpacing: 4,
                    childAspectRatio: (itemWidth / itemHeight),
                  ),
                  itemCount: dataCategoriesMock.length,
                  itemBuilder: (BuildContext context, int index) {
                    return FittedBox(
                      fit: BoxFit.scaleDown,
                      child: InkWell(
                        onTap: index == 1
                            ? () {
                                setState(() {
                                  _pageIndex = 1;
                                });
                                Navigator.pop(context);
                              }
                            : () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => DataPage(
                                          category: dataCategoriesMock[index],
                                        ))),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            (dataCategoriesMock[index].img != null)
                                ? Image.asset(
                                    dataCategoriesMock[index].img!,
                                    width: 32.w,
                                    height: 32.h,
                                  )
                                : const FlutterLogo(),
                            const SizedBox(
                              height: 8,
                            ),
                            Center(
                                child: Text(
                                    '${dataCategoriesMock[index].categoryName}')),
                          ],
                        ),
                      ),
                    );
                  }),
            )
          ],
        ),
      ));
    } else {
      setState(() {
        _pageIndex = i;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    _size = MediaQuery.of(context).size;

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        centerTitle: true,
        title: SvgPicture.asset(IconConstants.logoPhatGiao,
            fit: BoxFit.fitHeight, height: 32.h),
        leading: IconButton(
          icon: const Icon(Icons.sort),
          onPressed: () => _scaffoldKey.currentState?.openDrawer(),
        ),
        actions: [
          IconButton(
              onPressed: () => Navigator.push(context,
                  MaterialPageRoute(builder: (_) => const SearchPage())),
              icon: const Icon(
                Icons.search,
                size: 24,
              ))
        ],
      ),
      drawer: DrawerWidget(categories: widget.categories),
      body: IndexedStack(
        index: _pageIndex,
        children: const [
          HomePage(),
          DictionaryPage(),
          AboutUsPage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _pageIndex,
        onTap: _onBottomBarTap,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'HOME'),
          BottomNavigationBarItem(
              icon: Icon(Icons.my_library_books), label: 'TỪ ĐIỂN'),
          BottomNavigationBarItem(icon: Icon(Icons.dataset), label: 'DỮ LIÊỤ'),
        ],
      ),
    );
  }
}
