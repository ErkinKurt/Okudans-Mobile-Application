import 'package:flutter/material.dart';
import 'package:okudans_mobile/StudentUserInterface/dashboard_instructor.dart';
import 'package:okudans_mobile/StudentUserInterface/studenthome.dart';

LoginLogic(String username, BuildContext context) {
  if (username == 'admin' || username == 'ADMIN') {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => DashboardInstructor()));
  } else if (username == 'student' || username == 'STUDENT') {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => StudentHome()));
  } else
    _showDialog(context);
}

void _showDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: new Text("DİKKAT !"),
        content: new Text("Lütfen girmiş olduğunuz bilgileri kontrol ediniz.."),
        actions: <Widget>[
          new FlatButton(
            child: new Text("Tamam"),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
