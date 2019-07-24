class ProductBean {
  String image;
  double mallPrice;
  String goodsName;
  String goodsId;
  double price;

  ProductBean(
      {this.image, this.mallPrice, this.goodsName, this.goodsId, this.price});

  ProductBean.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    mallPrice = json['mallPrice'];
    goodsName = json['goodsName'];
    goodsId = json['goodsId'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['image'] = this.image;
    data['mallPrice'] = this.mallPrice;
    data['goodsName'] = this.goodsName;
    data['goodsId'] = this.goodsId;
    data['price'] = this.price;
    return data;
  }
}
