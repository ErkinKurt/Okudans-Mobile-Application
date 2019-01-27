import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class StudentAttendance extends StatefulWidget{
  @override
  StudentAttendanceState createState() {
    return new StudentAttendanceState();
  }
}

class StudentAttendanceState extends State<StudentAttendance> {
   var codeInputText = "Write down the code!";
   var document = Firestore.instance.collection("sessions");

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: Center(
        child: Column(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: this.codeInputText
              ),
            ),
            FloatingActionButton(
              onPressed: null,
              child: Text("Onayla"),
            )
          ],
        ),
      )
    );
  }
}