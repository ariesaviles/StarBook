import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:starbook_app/Friend.dart';
import 'package:starbook_app/addFriendPage.dart';
import 'dart:math' as math;

import 'package:starbook_app/handleRequests.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: AnimateOnScrollFlutter(),
        ),
      ),
    );
  }
}

class AnimateOnScrollFlutter extends StatefulWidget {
  @override
  _AnimateOnScrollFlutterState createState() => _AnimateOnScrollFlutterState();
}

class _AnimateOnScrollFlutterState extends State<AnimateOnScrollFlutter> {
  final controller = ScrollController();
  double appBarHeight = 200.0;

  // for friend container
  Friend frd;
  String name;

  // function to makeFriend Container
  Container makeFriend(int index) {
    frd = friends[index];
    // for friend container
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
//              new Row(
//                  children: <Widget>[
//                    new Text(frdSMR, style: TextStyle(fontSize: 15.0, fontFamily: 'Astro')),
//                  ]
//              )
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
            color: Colors.black26,
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
  } // makeFriend(index)

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.brown[200],
        child: SafeArea(
          child: CustomScrollView(
            controller: controller,
            slivers: <Widget>[
              SliverAppBar(
                pinned: true,
                expandedHeight: appBarHeight,
                floating: true,
                flexibleSpace: LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                    double percent = (((constraints.maxHeight) - kToolbarHeight ) *
                        100 /
                        (appBarHeight - kToolbarHeight ));
                    return Stack(
                      children: <Widget>[
                        Image.asset(
                          "assets/head-background.png",
                          fit: BoxFit.cover,
                          height: double.infinity,
                          width: double.infinity,
                        ),

    //                    Custom Paint
                        Container(
                          height: kToolbarHeight,
                          child: Row(
                            children: <Widget>[
                              Flexible(
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 8.0, top:8.0, bottom: 8.0, right: 8.0),
                                  child: CustomPaint(
                                    size: Size.fromHeight(kToolbarHeight),
                                    painter: CirclePainter(100 - percent),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

    //                    Text and Icon
                        Padding(
                          padding: const EdgeInsets.only(top: 0.0, right: 9.0),
                          child: Container(
                            height: kToolbarHeight,
                            child: Row(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "StarBook",
                                    style: TextStyle(color: Colors.white, fontFamily: 'Cagile', fontSize: 30.0),
                                  ),
                                ),
                                Spacer(),
                                GestureDetector(
                                  onTap: () {
                                    controller.animateTo(-appBarHeight,
                                        duration: Duration(seconds: 4),
                                        curve: Curves.fastOutSlowIn);
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.only(left:5.0, top:0.0, right: 0.0, bottom: 0.0),
                                    child:
                                      IconButton(
                                        icon: Icon(
                                          Icons.adjust,
                                          color: Colors.white,
                                        ),
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(builder: (context) => HandleRequests())
                                            );
                                        }, // onPressed
                                      ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),

              SliverList(
                  delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
                    return makeFriend(index);
                  }, childCount: friends.length,
                )
              ),


            ],
          ),
          )
      );
  }
}

///math math
class CirclePainter extends CustomPainter {
  double overallPercent;

  CirclePainter(this.overallPercent);

  @override
  void paint(Canvas canvas, Size size) {
    double circleSize = 25.0;
    double angle = math.pi / 180.0 * ((overallPercent * 360 / 100));
    double line = overallPercent * (size.width - circleSize) / 100;
    final paint = Paint()
      ..color = Colors.white
      ..strokeWidth = 2.0
      ..style = PaintingStyle.stroke;
    final path = Path();
    if (overallPercent < 50) {
      path.addPolygon([
        Offset(0.0, size.height),
        Offset((line * 2), size.height),
      ], false);
    }
    if (overallPercent > 50) {
      path.arcTo(
          Rect.fromLTWH(
              size.width - (circleSize * 2), 0.0, circleSize * 2, size.height),
          math.pi / 2,
          -angle * 2,
          false);
      if (overallPercent < 100) {
        path.addPolygon([
          Offset(overallPercent * (size.width - circleSize) / 100, size.height),
          Offset(size.width - circleSize, size.height),
        ], false);
      }
      if (overallPercent == 100) {
        path.addArc(
            Rect.fromLTWH(size.width - (circleSize * 2), 0.0, circleSize * 2,
                size.height),
            math.pi / 2,
            math.pi * 2);
      }
    }

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
//
//class HomePageBody extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return new Expanded(
//      child: new ListView.builder(
//          itemBuilder: (context, index) => new FriendRow(friends[index]),
//          itemCount: friends.length,
//          padding: new EdgeInsets.symmetric(vertical: 16.0)),
//    );
//  }
//
//} // HomePageBody