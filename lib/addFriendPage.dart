import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_progress_button/flutter_progress_button.dart';
import 'package:intl/intl.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:http/http.dart' as http;

class AddFriendPage extends StatefulWidget {
  @override
  _AddFriendPage createState() => _AddFriendPage();
}

// ListItem class for dropdown menus
class ListItem {
  int value;
  String name;

  // initializing value and name
  ListItem(this.value, this.name);
}

class _AddFriendPage extends State<AddFriendPage> {

  List<ListItem> months = [
    ListItem(1, "Jan"), ListItem(2, "Feb"), ListItem(3, "Mar"),
    ListItem(4, "Apr"), ListItem(5, "May"), ListItem(6, "Jun"),
    ListItem(7, "Jul"), ListItem(8, "Aug"), ListItem(9, "Sep"),
    ListItem(10, "Oct"), ListItem(11, "Nov"), ListItem(12, "Dec")
  ];

  List<ListItem> signs = [
    ListItem(1, "Aries"), ListItem(2, "Taurus"), ListItem(3, ""),
    ListItem(4, "Apr"), ListItem(5, "May"), ListItem(6, "Jun"),
    ListItem(7, "Jul"), ListItem(8, "Aug"), ListItem(9, "Sep"),
    ListItem(10, "Oct"), ListItem(11, "Nov"), ListItem(12, "Dec")
  ];

  List<DropdownMenuItem<ListItem>> dropdownMonths;
  ListItem selectedMonth;

  void initState() {
    super.initState();
    dropdownMonths = buildDropdownMonths (months);
    selectedMonth = dropdownMonths[0].value;
  }


  List<DropdownMenuItem<ListItem>> buildDropdownMonths(List monthList) {
    List<DropdownMenuItem<ListItem>> items = List();
    for (ListItem listedMonth in monthList) {
      items.add(
        DropdownMenuItem(
          child: Text(listedMonth.name),
          value: listedMonth,
        )
      );
    }
    return items;
  }

  var _signs = [
    "Capricorn", "Aquarius", "Pisces", "Aries", "Taurus",
    "Gemini", "Cancer", "Leo", "Virgo", "Libra", "Scorpio", "Sagittarius"
  ];


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
            // ##################  month Container  ##############
            new Container(
              padding: EdgeInsets.all(20.0),
              child: DropdownButton<ListItem> (
                value: selectedMonth,
                items: dropdownMonths,
                onChanged: (value) {
                  setState(() {
                    selectedMonth = value;
                  });
                },
              )
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
