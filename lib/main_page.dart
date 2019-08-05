import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mvp_shop/provider/main_index_provider.dart';
import 'package:provider/provider.dart';

import 'category_page.dart';
import 'home_page.dart';
import 'member_page.dart';
import 'shopping_cart_page.dart';

class MainPage extends StatelessWidget {
  final List<BottomNavigationBarItem> _bottomTabs = [
    BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.home),
      title: Text('首页'),
    ),
    BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.search),
      title: Text('分类'),
    ),
    BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.shopping_cart),
      title: Text('购物车'),
    ),
    BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.person),
      title: Text('会员中心'),
    ),
  ];

  final List<Widget> _pageList = [
    HomePage(),
    CategoryPage(),
    ShoppingCartPage(),
    MemberPage(),
  ];

  @override
  Widget build(BuildContext context) {
    var _currentIndex = Provider.of<MainIndexProvider>(context).currentIndex;
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _pageList,
      ),
      backgroundColor: Colors.white70,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        items: _bottomTabs,
        onTap: (index) {
          Provider.of<MainIndexProvider>(context).setIndex(index);
        },
      ),
    );
  }
}
