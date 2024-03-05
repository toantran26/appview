import 'package:app_phat_giao/data/model/tag.dart';

class NewsIntro {
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

  NewsIntro(
      {this.title,
      this.newsId,
      this.sapo,
      this.pushDate,
      this.signature,
      this.categoryId,
      this.image,
      this.link,
      this.content,
      this.tags});

  NewsIntro.fromJson(Map<String, dynamic> json) {
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
    data['signature'] = this.signature;
    data['push_date'] = this.pushDate;
    if (this.tags != null) {
      data['tags'] = this.tags!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class QuoteNews {
  String? newsId;
  String? image;
  String? name;
  String? pre;
  String? letter;
  String? content;
  String? link;
  List<NewsTag>? tags;

  QuoteNews(
      {this.newsId,
      this.image,
      this.name,
      this.pre,
      this.letter,
      this.content,
      this.link,
      this.tags});

  QuoteNews.fromJson(Map<String, dynamic> json) {
    newsId = json['news_id'];
    image = json['image'];
    name = json['name'];
    pre = json['pre'];
    letter = json['letter'];
    content = json['content'];
    link = json['link'];
    if (json['tags'] != null) {
      tags = <NewsTag>[];
      json['tags'].forEach((v) {
        tags!.add(new NewsTag.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['news_id'] = this.newsId;
    data['image'] = this.image;
    data['name'] = this.name;
    data['pre'] = this.pre;
    data['letter'] = this.letter;
    data['content'] = this.content;
    data['link'] = this.link;
    if (this.tags != null) {
      data['tags'] = this.tags!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
