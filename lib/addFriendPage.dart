import 'package:flutter/material.dart';
import 'package:starbook_app/HomePage.dart';

class AddFriendPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.brown[200],
      appBar: new AppBar(
        backgroundColor: Colors.black,
        title: new Text("StarBook"),
      ),
      body: new Column(
        children: <Widget>[
          new ListTile(

            title: new TextField(
              decoration: new InputDecoration(
                hintText: "Name",
              ),
            ),
          ),
          new ListTile(
            title: new TextField(
              decoration: new InputDecoration(
                hintText: "Phone",
              ),
            ),
          ),
          new ListTile(
            title: new TextField(
              decoration: new InputDecoration(
                hintText: "Email",
              ),
            ),
          ),
          const Divider(
            height: 1.0,
          ),
        ],
      ),
    );
  }
}
