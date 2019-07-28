import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'category_page.dart';
import 'home_page.dart';
import 'member_page.dart';
import 'shopping_cart_page.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
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

  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshConfiguration(
        hideFooterWhenNotFull: true,
        shouldFooterFollowWhenNotFull: (LoadStatus status) => status == LoadStatus.noMore,
        headerBuilder: () => ClassicHeader(
          releaseText: '释放刷新',
          refreshingText: '正在刷新...',
          completeText: '刷新完成！',
          failedText: '刷新失败',
          idleText: '下拉刷新',
        ),
        footerBuilder: () => ClassicFooter(
          idleText: '上拉加载...',
          noDataText: '没有更多数据...',
          loadingText: '加载中...',
        ),
        child: IndexedStack(
          index: _currentIndex,
          children: _pageList,
        ),
      ),
      backgroundColor: Colors.white70,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        items: _bottomTabs,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
