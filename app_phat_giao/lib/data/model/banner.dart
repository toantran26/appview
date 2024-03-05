class BannerResponse {
  String? url;
  String? image;

  BannerResponse({this.url, this.image});

  BannerResponse.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url'] = this.url;
    data['image'] = this.image;
    return data;
  }
}