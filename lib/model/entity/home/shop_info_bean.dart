class ShopInfoBean {
  String leaderImage;
  String leaderPhone;

  ShopInfoBean({this.leaderImage, this.leaderPhone});

  ShopInfoBean.fromJson(Map<String, dynamic> json) {
    leaderImage = json['leaderImage'];
    leaderPhone = json['leaderPhone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['leaderImage'] = this.leaderImage;
    data['leaderPhone'] = this.leaderPhone;
    return data;
  }
}