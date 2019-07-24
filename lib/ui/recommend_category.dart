import 'package:flutter/material.dart';
import 'package:flutter_mvp_shop/model/entity/home/image_info_bean.dart';
import 'package:flutter_mvp_shop/model/entity/home/picture_info_bean.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class RecommendCategory extends StatelessWidget {
  final PictureInfoBean _titleImage;
  final List<ImageInfoBean> _products;

  RecommendCategory(this._titleImage, this._products);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Image.network(
          _titleImage.pictureUrl,
          height: 100,
        ),
        _buildProductGrid(),
      ],
    );
  }

  Widget _buildProductGrid() {
    return StaggeredGridView.countBuilder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      crossAxisCount: 4,
      itemCount: _products.length,
      staggeredTileBuilder: (int index) =>
          StaggeredTile.count(2, index == 0 ? 2 : 1),
      itemBuilder: (BuildContext context, int index) => Container(
        child: Image.network(
          _products[index].image,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
