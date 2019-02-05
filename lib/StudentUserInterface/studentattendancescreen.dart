import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:okudans_mobile/BackendService/StudentOperations.dart';

class StudentAttendance extends StatefulWidget {
  @override
  StudentAttendanceState createState() {
    return new StudentAttendanceState();
  }
}

class StudentAttendanceState extends State<StudentAttendance> {
  var codeInputText = "Write down the code!";
  var document = Firestore.instance.collection("sessions");
  var session = Session("Asuman", new Student("AHAHAH", "Umut"), "1");
  var studentOs = StudentOperations();

  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
          color: Colors.blue,
          child: Center(
            child: Column(
              children: <Widget>[
                TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                  ),
                ),
                FloatingActionButton(
                  onPressed: () => studentOs.updateSession(session),
                  child: Text("Onayla"),
                )
              ],
            ),
          )),
    );
  }
}
