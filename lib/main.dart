import 'package:flutter/material.dart';
import 'package:flutter_mvp_shop/main_page.dart';
import 'package:flutter_mvp_shop/provide/top_category_tap_listener.dart';
import 'package:flutter_mvp_shop/util/inner_widgets_flutter_binding.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

void main() {
  var app = new MyApp();

  InnerWidgetsFlutterBinding.ensureInitialized()
    ..attachRootWidget(
      ChangeNotifierProvider<OnCategoryTapListener>.value(
        child: app,
        value: OnCategoryTapListener(),
      ),
    )
    ..scheduleWarmUpFrame();
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter-Shop',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: RefreshConfiguration(
        hideFooterWhenNotFull: true,
        shouldFooterFollowWhenNotFull: (LoadStatus status) =>
            status == LoadStatus.noMore,
        headerBuilder: () => ClassicHeader(
          releaseText: '释放刷新',
          refreshingText: '正在刷新...',
          completeText: '刷新完成！',
          failedText: '刷新失败！',
          idleText: '下拉刷新',
        ),
        footerBuilder: () => ClassicFooter(
          idleText: '上拉加载',
          noDataText: '没有更多数据...',
          loadingText: '加载中...',
        ),
        child: MainPage(),
      ),
    );
  }
}
