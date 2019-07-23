class PictureInfoBean {
  String pictureAddress;
  String toPlace;

  PictureInfoBean({this.pictureAddress, this.toPlace});

  PictureInfoBean.fromJson(Map<String, dynamic> json) {
    pictureAddress = json['PICTURE_ADDRESS'];
    toPlace = json['TO_PLACE'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['PICTURE_ADDRESS'] = this.pictureAddress;
    data['TO_PLACE'] = this.toPlace;
    return data;
  }
}