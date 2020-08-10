import 'package:flutter/material.dart';
import 'package:starbook_app/HomePageBody.dart';

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.brown[200],
      body: new Column(

//        children: <Widget>[
//          new PreferredSize(
//            preferredSize: Size.fromHeight(90.0),
//            child: AppBar(
//              title: Text(
//              'StarBook',
//              style: TextStyle(
//                fontSize: 50.0,
//                fontFamily: 'Cagile',
//                ),
//              ),
//          backgroundColor: Colors.black,
//            ),
//          ),
          new HomePageBody(),
        ],
      )
    );
  }
} // HomePage

class AnimateOnScroll extends StatefulWidget {
  @override
  _AnimateOnScrollState createState() => _AnimateOnScrollState();
}

class _AnimateOnScrollState extends State<AnimateOnScroll> {
  final controller = ScrollController();
  double appBarHeight = 200.0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
        controller: controller,
        slivers: <Widget>[
          SliverAppBar(
            pinned: true,
            expandedHeight: appBarHeight,
            floating: true,
            flexibleSpace: LayoutBuilder(
              builder: ()
            ),
          )
        ],
      )
    )
  }
}