import 'package:flutter/material.dart';
import 'package:starbook_app/Friend.dart';
import 'package:starbook_app/FriendRow.dart';

class HomePageBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new FriendRow(friends[0]);
  }

} // HomePageBody

