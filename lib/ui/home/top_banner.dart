import 'package:flutter/material.dart';
import 'package:flutter_mvp_shop/model/entity/home/image_info_bean.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class TopBanner extends StatelessWidget {
  final List<ImageInfoBean> data;

  TopBanner(this.data);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 178,
      child: Swiper(
        itemCount: data.length,
        itemBuilder: (BuildContext context, int index) =>
            Image.network(data[index].image),
        pagination: SwiperPagination(),
        autoplay: true,
      ),
    );
  }
}