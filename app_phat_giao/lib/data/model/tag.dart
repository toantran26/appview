class TrendingTag {
  String? title;
  String? trendId;
  String? slug;

  TrendingTag({this.title, this.trendId, this.slug});

  TrendingTag.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    trendId = json['trend_id'];
    slug = json['slug'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['trend_id'] = this.trendId;
    data['slug'] = this.slug;
    return data;
  }
}

class NewsTag {
  String? tagsId;
  String? tagTitle;

  NewsTag({this.tagsId, this.tagTitle});

  NewsTag.fromJson(Map<String, dynamic> json) {
    tagsId = json['tags_id'];
    tagTitle = json['tag_title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['tags_id'] = this.tagsId;
    data['tag_title'] = this.tagTitle;
    return data;
  }
}
