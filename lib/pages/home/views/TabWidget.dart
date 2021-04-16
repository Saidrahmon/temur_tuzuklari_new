import 'package:flutter/material.dart';

class TabWidget extends StatelessWidget {

  String title;

 TabWidget({required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(child: Text(title, style: TextStyle(fontSize: 16),), padding: EdgeInsets.only(top: 10, bottom: 10));
  }
}
