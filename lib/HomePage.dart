import 'package:flutter/material.dart';
import 'package:starbook_app/HomePageBody.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Color(0xFFccbfb8),
      body: new Column(
        children: <Widget>[
          new PreferredSize(
            preferredSize: Size.fromHeight(90.0),
            child: AppBar(
              title: Text(
              'StarBook',
              style: TextStyle(
                fontSize: 50.0,
                fontFamily: 'Cagile',
                ),
              ),
          backgroundColor: Colors.black,
            ),
          ),
          new HomePageBody(),
          new HomePageBody(),
          new HomePageBody(),
          new HomePageBody(),
        ],
      )
    );
  }
} // HomePage