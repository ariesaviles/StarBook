import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_progress_button/flutter_progress_button.dart';


class AddFriendPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.brown[200],
      appBar: new AppBar(
        backgroundColor: Colors.black,
        title: new Text("StarBook"),
      ),
      body: new Container(
        margin: new EdgeInsets.symmetric(vertical: 30.0, horizontal: 45.0),
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
        child: new Column(
          children: <Widget>[
            Padding(padding: const EdgeInsets.symmetric(vertical: 5.0)),
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
                  hintText: "Date of Birth",
                ),
              ),
            ),
            new ListTile(
              //contentPadding: EdgeInsets.only(bottom: 10.0),
              //onTap: ,
              title: new TextField(
                decoration: new InputDecoration(
                  hintText: "Sun Sign",
                ),
              ),
            ),
            new Divider(),
            ProgressButton(
              defaultWidget:
                const Text('Add Friend', style: TextStyle(color: Colors.white, fontFamily: 'FiraSans', fontSize: 14.0)),
              progressWidget: const CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white)),
              color: Colors.black26,
              width: 115,
              height: 50,
              borderRadius: 25,
              animate: false,
              onPressed: () async {
                int score = await Future.delayed(
                    const Duration(milliseconds: 4000), () => 42);
              },
            ),
          ],
        ),
      ),
    );
  } // build
} // class
