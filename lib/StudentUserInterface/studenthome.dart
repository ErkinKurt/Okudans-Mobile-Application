import 'package:flutter/material.dart';
import 'package:okudans_mobile/StudentUserInterface/studentattendancescreen.dart';

class StudentHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      color: Colors.black,
      child: new FloatingActionButton(
        backgroundColor: Colors.green,
        child: new Text("Yoklama Ver!"),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => StudentAttendance()));
        },

      ),
    );
  }
}
