import 'package:flutter/material.dart';
import 'package:flutter_mvp_shop/base/application.dart';
import 'package:flutter_mvp_shop/model/entity/home/image_info_bean.dart';
import 'package:flutter_mvp_shop/route/routes.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class TopBanner extends StatelessWidget {
  final List<ImageInfoBean> _data;

  TopBanner(this._data);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 178,
      child: Swiper(
        itemCount: _data.length,
        itemBuilder: (BuildContext context, int index) => InkWell(
          onTap: () {
            Application.router.navigateTo(
                context, '${Routes.PRODUCT_DETAILS}?productId=${_data[index].productId}');
          },
          child: Image.network(_data[index].image),
        ),
        pagination: SwiperPagination(),
        autoplay: true,
      ),
    );
  }
}
