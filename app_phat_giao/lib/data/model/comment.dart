class CommentRequest {
  String? fullname;
  String? email;
  String? comment;
  String? phone;

  CommentRequest({this.fullname, this.email, this.comment, this.phone});

  CommentRequest.fromJson(Map<String, dynamic> json) {
    fullname = json['fullname'];
    email = json['email'];
    comment = json['comment'];
    phone = json['phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['fullname'] = this.fullname;
    data['email'] = this.email;
    data['comment'] = this.comment;
    data['phone'] = this.phone;
    return data;
  }
}