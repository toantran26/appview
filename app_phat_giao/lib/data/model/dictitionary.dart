class DicritionaryWord {
  String? title;
  String? id;
  String? type;
  String? content;
  String? folder;

  DicritionaryWord({this.title, this.id, this.type, this.content, this.folder});

  DicritionaryWord.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    id = json['id'];
    type = json['type'];
    content = json['content'];
    folder = json['folder'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['id'] = this.id;
    data['type'] = this.type;
    data['content'] = this.content;
    data['folder'] = this.folder;
    return data;
  }
}