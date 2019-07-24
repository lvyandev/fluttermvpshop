class PictureInfoBean {
  String pictureUrl;
  String toPlace;

  PictureInfoBean({this.pictureUrl, this.toPlace});

  PictureInfoBean.fromJson(Map<String, dynamic> json) {
    pictureUrl = json['PICTURE_ADDRESS'];
    toPlace = json['TO_PLACE'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['PICTURE_ADDRESS'] = this.pictureUrl;
    data['TO_PLACE'] = this.toPlace;
    return data;
  }
}