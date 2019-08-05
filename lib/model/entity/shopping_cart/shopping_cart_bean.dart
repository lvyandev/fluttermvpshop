class ShoppingCartBean {
  int count;

  String goodsId;

  String goodsName;

  String images;

  double price;

  bool selected;

  ShoppingCartBean(
    this.goodsId,
    this.goodsName,
    this.images,
    this.price, {
    this.count = 1,
    this.selected = true,
  });

  factory ShoppingCartBean.fromJson(Map<String, dynamic> json) =>
      ShoppingCartBean(
        json['goodsId'] as String,
        json['goodsName'] as String,
        json['images'] as String,
        (json['price'] as num)?.toDouble(),
        count: json['count'] as int ?? 1,
        selected: (json['selected'] as num) == 1,
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'count': this.count,
        'goodsId': this.goodsId,
        'goodsName': this.goodsName,
        'images': this.images,
        'price': this.price,
        'selected': this.selected,
      };

  @override
  String toString() {
    return 'ShoppingCartBean{count: $count, goodsId: $goodsId, goodsName: $goodsName, images: $images, price: $price, selected: $selected}';
  }
}
