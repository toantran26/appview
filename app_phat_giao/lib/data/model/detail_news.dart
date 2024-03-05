import 'package:app_phat_giao/data/model/tag.dart';
import 'package:intl/intl.dart';

class DetailNews {
  String? title;
  String? newsId;
  String? sapo;
  String? categoryId;
  String? image;
  String? link;
  String? content;
  String? pushDate;
  String? signature;
  List<NewsTag>? tags;

  DateTime? get pushDateParsed =>
      pushDate == null ? null : DateTime.parse(pushDate!);

  String pushDateToString() {
    if (pushDateParsed == null) return '';

    var outputFormat = DateFormat('EEEE, dd/MM/yyyy, hh:mm', 'vi');
    var amPMFormat = DateFormat('a');

    return '${outputFormat.format(pushDateParsed!)} ${amPMFormat.format(pushDateParsed!)}';
  }

  DetailNews(
      {this.title,
      this.newsId,
      this.sapo,
      this.categoryId,
      this.image,
      this.link,
      this.content,
      this.pushDate,
      this.signature,
      this.tags});

  DetailNews.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    newsId = json['news_id'];
    sapo = json['sapo'];
    categoryId = json['category_id'];
    image = json['image'];
    link = json['link'];
    content = json['content'];
    pushDate = json['push_date'];
    signature = json['signature'];
    if (json['tags'] != null) {
      tags = <NewsTag>[];
      json['tags'].forEach((v) {
        tags!.add(new NewsTag.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['news_id'] = this.newsId;
    data['sapo'] = this.sapo;
    data['category_id'] = this.categoryId;
    data['image'] = this.image;
    data['link'] = this.link;
    data['content'] = this.content;
    data['push_date'] = this.pushDate;
    data['signature'] = this.signature;
    if (this.tags != null) {
      data['tags'] = this.tags!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
