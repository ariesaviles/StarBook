import 'dart:convert';
import 'dart:core';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:starbook_app/Friend.dart';
import 'package:starbook_app/friendAPI.dart';

/*
Future<http.Response> postChart(String lat, String lon,
                  String date, String time, String system) {
  return http.post(
    'https://api.immanuel.app/chart/natal',
    headers: <String, String> {
      'Content-Type': 'application/json; charset=UTF-8',
    },
    // the following data to be POSTed
    body: jsonEncode(<String, String> {
      'latitude': lat,
      'longitude': lon,
      'birth_date': date,
      'birth_time': time,
      'house_system': system,
    }),
  );
} // http.Response postChart
*/


Future<FriendAPI> postChart(String date) async {
  String lat = "38.4351213";
  String lon = "-90.9710779";
  String time = "03:16";
  String system = "Placidus";

  final http.Response response = await http.post(
    'https://api.immanuel.app/chart/natal',
    headers: <String, String> {
      'Content-Type': 'application/json; charset=UTF-8',
    },
    // the following data to be POSTed
    body: jsonEncode(<String, String> {
    'api_key': "WZVqMHzNmR4JxTrgM4eF2bILJFlzavQB",
    'api_secret': "qPlvkeznpp7U",
    'latitude': lat,
    'longitude': lon,
    'birth_date': date,
    'birth_time': time,
    'house_system': system,
    }),
    );
  //return FriendAPI.fromJson(jsonDecode(response.body));

  if (response.statusCode == 200 || response.statusCode == 201) {
    print(1);
    Map test = jsonDecode(response.body);
    return FriendAPI.fromJson(jsonDecode(response.body));
  } else {
    print(0);
    throw Exception('Failed to load friendAPI');
  }


} // friendAPI postChart

class HandleRequests extends StatefulWidget {
  @override
  _HandleRequests createState() => _HandleRequests();
}

class _HandleRequests extends State<HandleRequests> {
  final _controller = TextEditingController();
  Future<FriendAPI> _futureFriendAPI;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Create Data Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Create Data Example'),
        ),
        body: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(8.0),
          child: (_futureFriendAPI == null)
              ? Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                controller: _controller,
                decoration: InputDecoration(hintText: 'Enter Title'),
              ),
              RaisedButton(
                child: Text('Create Data'),
                onPressed: () {
                  setState(() {
                    _futureFriendAPI = postChart(_controller.text);
                  });
                },
              ),
            ],
          )
              : FutureBuilder<FriendAPI>(
            future: _futureFriendAPI,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                //print(test['planets']['sun']['sign']);
                return Text(snapshot.data.sun);
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }

              return CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  } // build()
}

