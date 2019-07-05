import 'package:flutter/material.dart';
import 'package:okudans_mobile/StudentUserInterface/attendancescreen.dart';

class StudentHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(

          backgroundColor: Colors.black,
          appBar: AppBar(

            backgroundColor: Colors.blueGrey ,
            title: Text("OKUDANS"),
          ),
          body: Container(
            color: Colors.black,
            margin: EdgeInsets.only(left: 80.0),
            padding: EdgeInsets.only(bottom: 40.0),

            child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[

                Image(
                  image: AssetImage('Assets/okudans.png'),


                ),
                Padding(
                  padding: EdgeInsets.only(bottom:50.0,top: 38.0),

                ),
                ButtonTheme(
                  minWidth: 100.0,
                  height: 80.0,
                  child: RaisedButton(
                    color: Colors.green,
                    child: Text('Yoklama ver'),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => AttendanceScreen()),
                      );
                    },

                  ),

                ),

              ],
            ),


          ),
        )
    );

  }
}
