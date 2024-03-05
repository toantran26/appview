class SearchKey {
  String? title;
  String? searchkeyId;
  String? link;

  SearchKey({this.title, this.searchkeyId, this.link});

  SearchKey.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    searchkeyId = json['searchkey_id'];
    link = json['link'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['searchkey_id'] = this.searchkeyId;
    data['link'] = this.link;
    return data;
  }
}