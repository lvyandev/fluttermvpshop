import 'package:flutter/material.dart';
import 'package:flutter_mvp_shop/provide/top_category_tap_listener.dart';
import 'package:provide/provide.dart';

class SubCategoryMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          _buildSubCategory(),
        ],
      ),
    );
  }

  _buildSubCategory() => Provide<OnCategoryTapListener>(
        builder: (
          BuildContext context,
          Widget child,
          OnCategoryTapListener value,
        ) =>
            Container(
          height: 40,
          width: 300,
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                width: .5,
                color: Colors.grey,
              ),
            ),
          ),
          child: ListView.builder(
            itemCount: value.list.length,
            itemBuilder: (
              BuildContext context,
              int index,
            ) =>
                Container(
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(
                horizontal: 10,
              ),
              child: Text(
                value.list[index].subCategoryName,
              ),
            ),
            scrollDirection: Axis.horizontal,
          ),
        ),
      );
}
