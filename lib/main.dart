import 'package:flutter/material.dart';
import 'package:starbook_app/HomePage.dart';
import 'package:flutter/services.dart';
import 'package:starbook_app/custom/CustomScrollBehavior.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.black, // navigation bar color
    statusBarColor: Colors.black, // status bar color
  ));
  runApp(new MaterialApp(
    title: "Friends",

    home: new HomePage(),

  ));
} // main


