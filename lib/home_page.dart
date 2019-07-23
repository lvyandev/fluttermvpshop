import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_mvp_shop/model/entity/base_bean.dart';
import 'package:flutter_mvp_shop/model/entity/home/home_bean.dart';
import 'package:flutter_mvp_shop/model/service/api_service.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    super.initState();
    getHomePageContent().then((response) {
      setState(() {
        var baseBean = BaseBean<HomeBean>.fromJson(json.decode(response));
        print(baseBean.toString());
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HomePage'),
      ),
    );
  }
}
