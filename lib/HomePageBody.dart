import 'package:flutter/material.dart';

class HomePageBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      height: 120.0,

      margin: const EdgeInsets.only(
        top: 25.0,
        bottom: 15.0,
        right: 25.0,
        left: 5.0,
      ),
      child: new Stack(
        children: <Widget>[
          friendCard,
          friendThumbnail,
        ],
      ),
    );
  } // Widget build


  final friendThumbnail = new Container(
    margin: new EdgeInsets.symmetric(vertical: 16.0),
    alignment: FractionalOffset.centerLeft,
    child: new Image(
      image: new AssetImage("assets/StarFriend.png"),
      height: 92.0,
      width: 92.0,
    ),
  ); // friendThumbnail

  final friendCard = new Container(
    height: 124.0,
    margin: new EdgeInsets.only(left: 46.0),
    decoration: new BoxDecoration(
      color: Colors.white,
      shape: BoxShape.rectangle,
      borderRadius: new BorderRadius.circular(5.0),
      boxShadow: <BoxShadow>[
        new BoxShadow(
          color: Colors.black12,
          blurRadius: 7.0,
          offset: new Offset(0.0, 10.0),
        ),
      ],
    ),
  ); // friendCard

} // HomePageBody

