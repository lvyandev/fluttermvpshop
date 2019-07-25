class SubCategoryBean {
  String subId;
  String categoryId;
  String subCategoryName;
  String comments;

  SubCategoryBean(
      {this.subId, this.categoryId, this.subCategoryName, this.comments});

  SubCategoryBean.fromJson(Map<String, dynamic> json) {
    subId = json['mallSubId'];
    categoryId = json['mallCategoryId'];
    subCategoryName = json['mallSubName'];
    comments = json['comments'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['mallSubId'] = this.subId;
    data['mallCategoryId'] = this.categoryId;
    data['mallSubName'] = this.subCategoryName;
    data['comments'] = this.comments;
    return data;
  }
}
