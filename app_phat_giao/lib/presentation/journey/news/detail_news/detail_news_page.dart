import 'dart:developer';

import 'package:app_phat_giao/commons/utils/utils.dart';
import 'package:app_phat_giao/data/model/detail_news.dart';
import 'package:app_phat_giao/data/model/news.dart';
import 'package:app_phat_giao/data/model/tag.dart';
import 'package:app_phat_giao/data/remote_source/news_data_remote_source.dart';
import 'package:app_phat_giao/presentation/app/styles/style.dart';
import 'package:app_phat_giao/presentation/components/about_us/about_us_content.dart';
import 'package:app_phat_giao/presentation/components/about_us/donate_content.dart';
import 'package:app_phat_giao/presentation/components/about_us/footer_note_content.dart';
import 'package:app_phat_giao/presentation/components/future_handler/future_handler.dart';
import 'package:app_phat_giao/presentation/components/items/tag_item.dart';
import 'package:app_phat_giao/presentation/components/layouts/error_layout.dart';
import 'package:app_phat_giao/presentation/journey/home/widgets/event_news.dart';
import 'package:app_phat_giao/presentation/journey/home/widgets/most_read_news.dart';
import 'package:app_phat_giao/presentation/journey/home/widgets/selective_news.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart' as html;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../components/layouts/body_with_footer_layout.dart';
import '../../../components/layouts/display_picture_layout.dart';
import 'detail_news_page_by_id.dart';
import 'widgets/comment_form.dart';
import 'widgets/render_relation_news.dart';

class DetailNewsPage extends StatefulWidget {
  const DetailNewsPage({Key? key, this.newsIntro, this.detailNews})
      : super(key: key);

  final NewsIntro? newsIntro;
  final DetailNews? detailNews;

  @override
  State<DetailNewsPage> createState() => _DetailNewsPageState();
}

class _DetailNewsPageState extends State<DetailNewsPage> {
  final NewsDataRemoteSource _newsDataRemoteSource = Get.find();

  @override
  Widget build(BuildContext context) {
    if (widget.newsIntro != null) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: mPrimaryColor,
          title: Text(
            (widget.newsIntro?.title ?? ''),
            style: Theme.of(context)
                .textTheme
                .titleMedium
                ?.copyWith(color: mWhite, fontWeight: FontWeight.w500),
          ),
          iconTheme: const IconThemeData(color: mWhite),
        ),
        body: FutureRender<List<DetailNews>>(
          future:
              _newsDataRemoteSource.getDetailNews(widget.newsIntro!.newsId!),
          resultWidget: (result) => _renderBody(result[0]),
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

    return Scaffold(
        appBar: AppBar(
          backgroundColor: mPrimaryColor,
          title: Text(
            (widget.detailNews?.title ?? ''),
            style: Theme.of(context)
                .textTheme
                .titleSmall
                ?.copyWith(color: mWhite, fontWeight: FontWeight.w500),
          ),
          iconTheme: const IconThemeData(color: mWhite),
        ),
        body: _renderBody(widget.detailNews!));
  }

  Widget _renderBody(DetailNews detailNews) {
    return BodyWithFooterLayout(
      showDonate: false,
      showEvent: false,
      padding: EdgeInsets.symmetric(vertical: 16.h),
      child: Column(
        children: [
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _renderPushDate(detailNews.pushDateToString()),
                  SizedBox(
                    height: 8.h,
                  ),
                  _renderTitle(detailNews.title),
                  SizedBox(
                    height: 8.h,
                  ),
                  _renderSignature(detailNews.signature),
                  SizedBox(
                    height: 8.h,
                  ),
                  _renderSapo(detailNews.sapo),
                  SizedBox(
                    height: 8.h,
                  ),
                  _renderContent(detailNews.newsId!, detailNews.content),
                ],
              )),
          SizedBox(
            height: 8.h,
          ),
          const DonateContent(),
          SizedBox(
            height: 8.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            child: _renderTags(detailNews.tags!),
          ),
          SizedBox(
            height: 8.h,
          ),
          CommentForm(newsId: detailNews.newsId!),
          SizedBox(
            height: 8.h,
          ),
          RenderRelationNews(
            newsId: detailNews.newsId!,
          ),
          SizedBox(
            height: 8.h,
          ),
          const EventNews(),
          SizedBox(
            height: 8.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            child: Column(
              children: [
                const MostReadNews(),
                SizedBox(
                  height: 8.h,
                ),
                const SelectiveNews(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _renderPushDate(String? date) {
    return date != null
        ? Text(
            date,
            style: TextStyle(color: mCaptionColor, fontSize: 14.sp),
          )
        : const SizedBox.shrink();
  }

  Widget _renderTitle(String? title) {
    return Text(
      title ?? '',
      style: Theme.of(context).textTheme.titleMedium,
    );
  }

  Widget _renderSignature(String? signature) {
    if (signature == null || signature.isEmpty) {
      return const SizedBox.shrink();
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 8,
          width: 8,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25), color: mPrimaryColor),
        ),
        SizedBox(
          width: 8.w,
        ),
        Expanded(
          child: Text(
            signature,
            style: Theme.of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(fontWeight: FontWeight.w600, color: mBlackBody2),
          ),
        )
      ],
    );
  }

  Widget _renderSapo(String? sapo) {
    return Text(
      sapo ?? '',
      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
          fontWeight: FontWeight.bold, color: const Color(0xff444444)),
    );
  }

  Widget _renderContent(String id, String? content) {
    log(content ?? '');
    return html.Html(
      data: content,
      // tagsList: Html.tags..addAll(["bird", "flutter"]),
      style: {
        "figure": html.Style(
            padding: EdgeInsets.zero,
            margin: EdgeInsets.zero,
            width: double.maxFinite),
        "figcaption": html.Style(
          textAlign: TextAlign.center,
          alignment: Alignment.center
        ),
        "table": html.Style(
          backgroundColor: const Color.fromARGB(0x50, 0xee, 0xee, 0xee),
        ),
        "tr": html.Style(
          border: const Border(bottom: BorderSide(color: Colors.grey)),
        ),
        "th": html.Style(
          padding: const EdgeInsets.all(6),
          backgroundColor: Colors.grey,
        ),
        "td": html.Style(
          padding: const EdgeInsets.all(6),
          alignment: Alignment.topLeft,
        ),
        'h5': html.Style(maxLines: 2, textOverflow: TextOverflow.ellipsis),
      },
      customRender: {
        "table": (context, child) {
          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: (context.tree as html.TableLayoutElement).toWidget(context),
          );
        },
        "bird": (html.RenderContext context, Widget child) {
          return const TextSpan(text: "🐦");
        },
        "figcaption": (html.RenderContext context, Widget child) {
          final caption = context.tree.children[0].children[0]
              .toString()
              .replaceAll('\"', '');
          print(caption);
          return Center(
            child: Text(
              caption,
              style: TextStyle(fontSize: 12.sp, color: mGrayColor),
            ),
          );
        },
        "flutter": (html.RenderContext context, Widget child) {
          return FlutterLogo(
            style: (context.tree.element!.attributes['horizontal'] != null)
                ? FlutterLogoStyle.horizontal
                : FlutterLogoStyle.markOnly,
            textColor: context.style.color!,
            size: context.style.fontSize!.size! * 5,
          );
        },
      },
      customImageRenders: {
        html.networkSourceMatcher(domains: ["flutter.dev"]):
            (context, attributes, element) {
          return const FlutterLogo(size: 36);
        },
        html.networkSourceMatcher(domains: ["phatgiao.org.vn"]):
            html.networkImageRender(
          headers: {"Custom-Header": "some-value"},
          altWidget: (alt) => Text(alt ?? ""),
          loadingWidget: () => const Text("Loading..."),
        ),
        // On relative paths starting with /wiki, prefix with a base url
        (attr, _) => attr["src"] != null && attr["src"]!.startsWith("/wiki"):
            html.networkImageRender(
                mapUrl: (url) => "https://upload.wikimedia.org" + url!),
        // Custom placeholder image for broken links
        html.networkSourceMatcher():
            html.networkImageRender(altWidget: (_) => const FlutterLogo()),
      },
      onLinkTap: (url, _, __, ___) {
        // print("Opening $url...");
        if (url != null) {
          final idFromURL = Utils.getNewsIDFromURL(url);
          if (idFromURL != id) {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) => DetailNewsPageByID(
                          newsID: Utils.getNewsIDFromURL(url),
                        )));
          }
        }
      },
      onImageTap: (src, _, __, ___) {
        if (src != null) {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (_) => DisplayPictureLayout(
                        url: src,
                      )));
        }
      },
    );
  }

  Widget _renderTags(List<NewsTag> tags) {
    return Align(
      alignment: Alignment.topLeft,
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        spacing: 4.w,
        runSpacing: 8.h,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.tag),
              SizedBox(
                width: 4.w,
              ),
              Text('Tags:'),
              SizedBox(
                width: 4.w,
              ),
            ],
          ),
          ...tags
              .map((e) => TagItem(
                    newsTag: e,
                  ))
              .toList()
        ],
      ),
    );
  }
}
