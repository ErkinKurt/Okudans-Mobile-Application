import 'package:flutter/material.dart';
import 'package:okudans_mobile/BackendService/StudentOperations.dart';
import 'package:okudans_mobile/StudentUserInterface/take_attendance.dart';
import 'package:okudans_mobile/StudentUserInterface/class_sections.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

SelectClass(DocumentSnapshot doc, BuildContext context) {
  Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => TakeAttendance(
                session: doc,
              )));
}
