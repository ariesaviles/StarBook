import 'package:flutter/material.dart';
import 'package:starbook_app/Friend.dart';
import 'package:starbook_app/FriendRow.dart';

class HomePageBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Expanded(
      child: new ListView.builder(
        itemBuilder: (context, index) => new FriendRow(friends[index]),
        itemCount: friends.length,
        padding: new EdgeInsets.symmetric(vertical: 16.0)),
    );
  }

} // HomePageBody

