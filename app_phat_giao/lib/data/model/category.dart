class Category {
  String? categoryName;
  String? categoryId;
  String? slug;
  String? img;
  List<Category>? children;

  Category(
      {this.categoryName,
      this.categoryId,
      this.slug,
      this.img,
      this.children});

  Category.fromJson(Map<String, dynamic> json) {
    categoryName = json['category_name'];
    categoryId = json['category_id'];
    slug = json['slug'];
    if (json['cates_child'] != null) {
      children = <Category>[];
      json['cates_child'].forEach((v) {
        children!.add(new Category.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['category_name'] = categoryName;
    data['category_id'] = categoryId;
    data['slug'] = slug;
    if (this.children != null) {
      data['cates_child'] = this.children!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
