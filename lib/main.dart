import 'package:flutter/material.dart';
import 'package:okudans_mobile/StudentUserInterface/studenthome.dart';
import 'BackendService/StudentOperations.dart';
import 'StudentUserInterface/login.dart';

void main() {
  runApp(new MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "Okudans",
    home: new OkuDansApp(),
  ));
}
