import 'package:flutter/material.dart';
import 'package:okudans_mobile/StudentUserInterface/studentattendancescreen.dart';
import 'package:okudans_mobile/StudentUserInterface/attendancescreen.dart';

class StudentHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          resizeToAvoidBottomPadding: false,
          backgroundColor: Colors.black,
          body: new Stack(
            children: <Widget>[
              new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new Container(
                    height: 65.0,
                  ),
                  new Container(
                    height: 100.0,
                    padding: EdgeInsets.only(left: 5.0, right: 5.0),
                    child: new Image(
                      image: new AssetImage("assets/images/logo.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(height: 150.0),
                  Center(
                    child: Container(
                        alignment: Alignment(0.0, 0.0),
                        width: 200.0,
                        height: 90.0,
                        child: ButtonTheme(
                          minWidth: 150.0,
                          height: 100.0,
                          child: RaisedButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          AttendanceScreen()));
                            },
                            padding: EdgeInsets.only(
                                left: 2.0, right: 2.0, bottom: 1.0, top: 1.0),
                            color: Colors.lightGreen,
                            child: Text('Yoklama Ver',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 25.0,
                                  fontWeight: FontWeight.bold,
                                )),
                          ),
                        )),
                  ),
                ],
              )
            ],
          ),
        ));
  }
}
