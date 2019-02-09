import 'package:flutter/material.dart';
import 'package:okudans_mobile/StudentUserInterface/studentattendancescreen.dart';
import 'package:okudans_mobile/BackendService/StudentOperations.dart';
import 'package:okudans_mobile/StudentUserInterface/studenthome.dart';

class AttendanceScreen extends StatefulWidget {
  @override
  AttendanceScreenState createState() {
    return new AttendanceScreenState();
  }
}

class AttendanceScreenState extends State<AttendanceScreen> {
  final myController = TextEditingController();
  final myBabaCont = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the Widget is disposed
    myController.dispose();
    super.dispose();
  }

  void succesful(BuildContext context) {
    Session session = new Session(
        "Asuman", new Student(myBabaCont.text, "Temmuz"), myController.text);
    StudentOperations studentOs = StudentOperations();
    studentOs.updateSession(session);

    var alertDialog;
    alertDialog = AlertDialog(
      title: Text("DİKKAT !!"),
      content: Text("Yoklamanız başarıyla alınmıştır..."),
      actions: <Widget>[
        FlatButton(
          child: Text("Tamam"),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => StudentHome()),
            );
          },
        )
      ],
    );
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return alertDialog;
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'Yoklama Ver',
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
              child: new Text("Sınıf Kodu",
                  style: TextStyle(
                      color: Colors.teal,
                      fontSize: 35.0,
                      fontWeight: FontWeight.w700)),
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
                            controller: myController,
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
              child: new Text("Öğrenci Adı",
                  style: TextStyle(
                      color: Colors.teal,
                      fontSize: 35.0,
                      fontWeight: FontWeight.w700)),
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
                            controller: myBabaCont,
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
                              minWidth: 225.0,
                              height: 175.0,
                              child: RaisedButton(
                                onPressed: () {succesful(context);},
                                padding: EdgeInsets.only(
                                    left: 2.0,
                                    right: 2.0,
                                    bottom: 1.0,
                                    top: 1.0),
                                color: Colors.lightGreen,
                                child: Text('Yoklama Ver',
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
