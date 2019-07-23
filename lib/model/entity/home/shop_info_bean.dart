class ShopInfoBean {
  String leaderAvatar;
  String leaderPhone;

  ShopInfoBean({this.leaderAvatar, this.leaderPhone});

  ShopInfoBean.fromJson(Map<String, dynamic> json) {
    leaderAvatar = json['leaderImage'];
    leaderPhone = json['leaderPhone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['leaderImage'] = this.leaderAvatar;
    data['leaderPhone'] = this.leaderPhone;
    return data;
  }
}