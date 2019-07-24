import 'package:flutter/material.dart';
import 'package:flutter_mvp_shop/model/entity/home/shop_info_bean.dart';
import 'package:url_launcher/url_launcher.dart';

class ShopManagerInfo extends StatelessWidget {
  final ShopInfoBean _data;

  ShopManagerInfo(this._data);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: InkWell(
        onTap: () => _launchUri('tel:${_data.leaderPhone}'),
        child: Image.network(_data.leaderImage),
      ),
    );
  }

  _launchUri(String uri) async {
    if (await canLaunch(uri)) {
      await launch(uri);
    } else {
      throw 'Could not launch $uri';
    }
  }
}
