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

  void succesful(BuildContext context)
  {

    Session session = new Session("Asuman", new Student(myBabaCont.text, "Temmuz"), myController.text);
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
        builder: (BuildContext context){
          return alertDialog;
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey,

        appBar: AppBar(
          backgroundColor: Colors.blueGrey ,
          title: Text("Yoklama Ver"),
        ),
        body: new Container(
          padding: new EdgeInsets.all(30.0),
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Text("Sınıf Kodunu giriniz :"),
              new TextField(
                controller: myController,
                maxLines:2,
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(40.0),
                    border: InputBorder.none,
                    hintText: 'Buraya giriniz.'
                ),
              ),
              new Text("Ad - Soyadı Giriniz :"),
              new TextField(
                controller: myBabaCont,
                maxLines:2,
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(40.0),
                    border: InputBorder.none,
                    hintText: 'Buraya giriniz.'
                ),
              ),
              ButtonTheme(
                minWidth: 100.0,
                height: 80.0,
                child: RaisedButton(
                  color: Colors.green,

                  child: Text("Onayla"),
                  onPressed: () => succesful(context),
                ),
              )


            ],
          ),

        ),


      ),
    );
  }
}
