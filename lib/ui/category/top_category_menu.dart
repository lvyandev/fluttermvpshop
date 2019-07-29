import 'package:flutter/material.dart';
import 'package:flutter_mvp_shop/model/entity/category/category_bean.dart';
import 'package:flutter_mvp_shop/provide/top_category_tap_listener.dart';
import 'package:provider/provider.dart';

class TopCategoryMenu extends StatefulWidget {
  final List<CategoryBean> _data;

  TopCategoryMenu(this._data);

  @override
  _TopCategoryMenuState createState() => _TopCategoryMenuState();
}

class _TopCategoryMenuState extends State<TopCategoryMenu> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      decoration: BoxDecoration(
        border: Border(
          right: BorderSide(
            color: Colors.grey,
            width: 0.5,
          ),
        ),
      ),
      child: ListView.separated(
        physics: BouncingScrollPhysics(),
        itemBuilder: (BuildContext context, int index) =>
            Consumer<OnCategoryTapListener>(
          builder: (
            BuildContext context,
            OnCategoryTapListener value,
            Widget child,
          ) =>
              ListTile(
            selected: _currentIndex == index,
            contentPadding: EdgeInsets.only(left: 10),
            onTap: () {
              setState(() {
                value.onTapCategory(widget._data[index]);
                _currentIndex = index;
              });
            },
            title: child,
          ),
          child: Text(widget._data[index].categoryName),
        ),
        separatorBuilder: (BuildContext context, int index) => Divider(
          color: Colors.grey,
          height: 0.5,
        ),
        itemCount: widget._data.length,
      ),
    );
  }
}
