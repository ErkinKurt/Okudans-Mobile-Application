import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:okudans_mobile/BackendService/StudentOperations.dart';

class TakeAttendance extends StatefulWidget {
  TakeAttendance({this.session});
  final DocumentSnapshot session;
  @override
  State createState() => TakeAttendanceState(session: session);
}

class TakeAttendanceState extends State<TakeAttendance> {
  TakeAttendanceState({this.session});

  DocumentSnapshot session;

  var document = Firestore.instance.collection("sessions");

  var studentOs = StudentOperations();

  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'Yoklama Al',
          style: TextStyle(
            color: Colors.blueAccent,
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      resizeToAvoidBottomPadding: false,
      backgroundColor: Colors.grey,
      body: new Stack(children: <Widget>[
        new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Container(
              height: 42.0,
            ),
            new Container(
              margin: EdgeInsets.only(left: 35.0),
              child: new Text("Sınıf Adı",
                  style: TextStyle(
                      color: Colors.blueAccent,
                      fontSize: 35.0,
                      fontWeight: FontWeight.w400)),
            ),
            new Form(
                child: Theme(
                    data: new ThemeData(
                      brightness: Brightness.dark,
                      primarySwatch: Colors.red,
                    ),
                    child: new Column(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.fromLTRB(40.0, 5.0, 40.0, 20.0),
                          child: new TextFormField(
                            enabled: false,
                            initialValue: session.data['className'],
                            decoration: new InputDecoration(
                                fillColor: Colors.white,
                                filled: true,
                                border: OutlineInputBorder(),
                                /*hintText: "Section Adı",
                                hintStyle: TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w900),*/
                                contentPadding:
                                    EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 1.0)),
                            style: TextStyle(
                              color: Colors.black,
                              height: 1.5,
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                            keyboardType: TextInputType.text,
                          ),
                        ),
                      ],
                    ))),
            new Container(
              margin: EdgeInsets.only(left: 35.0),
              child: new Text("Tarih",
                  style: TextStyle(
                      color: Colors.blueAccent,
                      fontSize: 35.0,
                      fontWeight: FontWeight.w400)),
            ),
            new Form(
                child: Theme(
                    data: new ThemeData(
                      brightness: Brightness.dark,
                      primarySwatch: Colors.red,
                    ),
                    child: new Column(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.fromLTRB(40.0, 5.0, 40.0, 20.0),
                          child: new TextFormField(
                            enabled: false,
                            initialValue: session.data['sessionDate'].toString().substring(0, 10),
                            decoration: new InputDecoration(
                                fillColor: Colors.white,
                                filled: true,
                                border: OutlineInputBorder(),
                                /*hintText: "Section Adı",
                                hintStyle: TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w900),*/
                                contentPadding:
                                    EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 1.0)),
                            style: TextStyle(
                              color: Colors.black,
                              height: 1.5,
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                            keyboardType: TextInputType.text,
                          ),
                        ),
                        SizedBox(height: 45.0),
                        Container(
                            alignment: Alignment(1.0, 1.0),
                            width: 325.0,
                            height: 50.0,
                            child: ButtonTheme(
                              minWidth: 150.0,
                              height: 100.0,
                              child: RaisedButton(
                                onPressed: () {},
                                padding: EdgeInsets.only(
                                    left: 2.0,
                                    right: 2.0,
                                    bottom: 1.0,
                                    top: 1.0),
                                color: Colors.lightGreen,
                                child: Text('Yoklama Al',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 25.0,
                                      fontWeight: FontWeight.bold,
                                    )),
                              ),
                            )),
                      ],
                    ))),
          ],
        ),
      ]),
    );
  }
}
