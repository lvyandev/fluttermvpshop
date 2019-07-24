import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HotSellers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Chip(
          backgroundColor: Colors.transparent,
          label: Text(
            '火爆专区',
          ),
          avatar: CircleAvatar(
              backgroundColor: Colors.pink,
              child: Text(
                '火',
                style: TextStyle(
                  color: Colors.white,
                ),
              )),
        ),
      ],
    );
  }
}
