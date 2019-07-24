import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_mvp_shop/model/entity/category_bean.dart';

class CategoryMenu extends StatelessWidget {
  final List<CategoryBean> data;

  CategoryMenu(this.data);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      children: data.map((item) => _buildItem(item, context)).toList(),
      crossAxisCount: 5,
    );
  }

  Widget _buildItem(CategoryBean item, BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.only(top: 5),
      child: Column(
        children: <Widget>[
          Image.network(
            item.image,
            height: 55,
          ),
          SizedBox(
            height: 2,
          ),
          Text(
            item.categoryName,
            style: Theme.of(context).textTheme.caption,
          ),
        ],
      ),
    );
  }
}
