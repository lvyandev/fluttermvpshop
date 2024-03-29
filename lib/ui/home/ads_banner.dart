import 'package:flutter/material.dart';
import 'package:flutter_mvp_shop/model/entity/home/picture_info_bean.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class AdsBanner extends StatelessWidget {
  final List<PictureInfoBean> _data;

  AdsBanner(this._data);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 5),
      color: Colors.white,
      height: 50,
      child: Swiper(
        scrollDirection: Axis.vertical,
        itemCount: _data.length,
        autoplay: true,
        itemBuilder: (BuildContext context, int index) =>
            Image.network(_data[index].pictureUrl),
      ),
    );
  }
}
