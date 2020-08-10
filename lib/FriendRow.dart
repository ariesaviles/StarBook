import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:starbook_app/Friend.dart';

class FriendRow extends StatelessWidget {
  final Friend frd;
  String name;
  FriendRow(this.frd);

  @override
  Widget build(BuildContext context) {
    String frdBio;
    frdBio = '${frd.sunsign} - ${frd.birthday} - ${frd.birthtime}';
    String frdSMR;
    frdSMR = 'c';
    Color element;

    // element color switch case
    switch(frd.element) {
      case "earth": { element = Colors.green; }
      break;
      case "water": { element = Colors.blue; }
      break;
      case "air": { element = Colors.amber; }
      break;
      case "fire": { element = Colors.red; }
      break;
    } // swtich

    final friendCardContent = new Container(
        margin: new EdgeInsets.fromLTRB(50.0, 16.0, 16.0, 16.0),
        constraints: new BoxConstraints.expand(),
        child: new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // top portion
              new Container(height: 4.0),
              new Text(frd.name,
                  style: TextStyle(
                      fontSize: 20.0,
                      fontFamily: 'Cagile',
                      //fontWeight: FontWeight.w500
                  )
              ),
              new Container(height: 3.0),
              new Text(frdBio,
                style: TextStyle(
                    fontSize: 12.0,
                    fontFamily: 'FiraSans',
                    color: Colors.grey)
              ),
              // separator
              new Container(
                margin: new EdgeInsets.symmetric(vertical: 10.0, horizontal: 0.0),
                height: 3.0,
                width: 75.0,
                color: element,
              ),
              // bottom portion
              new Row(
                children: <Widget>[
                  new Text(frdSMR, style: TextStyle(fontSize: 15.0, fontFamily: 'Astro')),
                ]
              )
            ]
        )
    );

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
      child: friendCardContent,
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

    return new Container(
      height: 130.0,

      margin: const EdgeInsets.only(
        top: 25.0,
        bottom: 15.0,
        right: 45.0,
        left: 15.0,
      ),
      child: new Stack(
        children: <Widget>[
          friendCard,
          friendThumbnail,
        ],
      ),
    );
  } // Widget build



}// FriendRow
