class ImageInfoBean {
  String image;
  String productId;

  ImageInfoBean({this.image, this.productId});

  ImageInfoBean.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    productId = json['goodsId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['image'] = this.image;
    data['goodsId'] = this.productId;
    return data;
  }
}