import 'package:app_phat_giao/data/model/tag.dart';
import 'package:app_phat_giao/data/remote_source/tag_remote_source.dart';
import 'package:app_phat_giao/presentation/components/future_handler/future_handler.dart';
import 'package:app_phat_giao/presentation/components/layouts/error_layout.dart';
import 'package:app_phat_giao/presentation/journey/home/widgets/most_read_news.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../components/about_us/about_us_content.dart';
import '../../components/about_us/donate_content.dart';
import '../../components/about_us/footer_note_content.dart';
import '../../components/layouts/body_with_footer_layout.dart';
import '../dictionary/dictionary_component.dart';
import '../news/news_list_by_trending/news_list_by_trending_page.dart';
import 'widgets/event_news.dart';
import 'widgets/quote_news.dart';
import 'widgets/render_3_news_in_home.dart';
import 'widgets/render_5_news_in_home.dart';
import 'widgets/render_9_news_under_event.dart';
import 'widgets/render_9_news_under_media.dart';
import 'widgets/render_media.dart';
import 'widgets/render_middle_home_banner.dart';
import 'widgets/render_population_search_key.dart';
import 'widgets/render_top_home_banner.dart';
import 'widgets/selective_news.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TagRemoteSource _tagRemoteSource = Get.find();

  @override
  Widget build(BuildContext context) {
    return FutureRender<List<TrendingTag>>(
      future: _tagRemoteSource.getTrendingTags(),
      resultWidget: (trendingTags) {
        return BodyWithFooterLayout(
          child: Column(
            children: [
              const RenderTopHomeBanner(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 16.h,
                    ),
                    _renderTrending(trendingTags),
                    SizedBox(
                      height: 16.h,
                    ),
                    const Render3NewsInHome(),
                    SizedBox(
                      height: 16.h,
                    ),
                    const Render5NewsInHome(),
                    SizedBox(
                      height: 16.h,
                    ),
                    const RenderPopulationSearchKey(),
                  ],
                ),
              ),
              SizedBox(
                height: 16.h,
              ),
              const RenderQuoteNews(),
              const EventNews(),
              SizedBox(
                height: 16.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: const Render9NewsUnderEvent(),
              ),
              SizedBox(
                height: 16.h,
              ),
              const RenderMedia(),
              SizedBox(
                height: 16.h,
              ),
              const RenderMiddleHomeBanner(),
              SizedBox(
                height: 16.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Column(
                  children: [
                    const Render9NewsUnderMedia(),
                    SizedBox(
                      height: 16.h,
                    ),
                    const MostReadNews(),
                    SizedBox(
                      height: 16.h,
                    ),
                    const SelectiveNews()
                  ],
                ),
              ),
            ],
          ),
        );
      },
      errorWidget: (error) {
        return ErrorLayout(
          onTryAgain: () {
            setState(() {});
          },
        );
      },
    );
  }

  Widget _renderTrending(List<TrendingTag> trendings) {
    return SizedBox(
      height: 32.h,
      child: Row(
        children: [
          const Icon(
            Icons.show_chart,
            size: 24,
          ),
          Text(
            'Trending: ',
            style: Theme.of(context).textTheme.caption,
          ),
          Expanded(
            // height: 48.h,
            child: ListView.separated(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemBuilder: (ct, i) => InkWell(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => NewsListByTrendingPage(
                                    trendingTag: trendings[i],
                                  ))),
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            border: Border.all(color: Colors.grey)),
                        padding: EdgeInsets.symmetric(horizontal: 8.w),
                        child: Text(trendings[i].title ?? ''),
                      ),
                    ),
                separatorBuilder: (_, __) => SizedBox(
                      width: 8.w,
                    ),
                itemCount: trendings.length),
          )
        ],
      ),
    );
  }
}
