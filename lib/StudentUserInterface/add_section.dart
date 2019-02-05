import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:okudans_mobile/BackendService/StudentOperations.dart';

class AddSection extends StatefulWidget {
  @override
  State createState() => SectionFormState();
}

class SectionFormState extends State<AddSection> {
  var document = Firestore.instance.collection("sessions");
  var session =
      Session("Asuman", new Student("TestName", "TestMonth"), "Section 2");
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
          'Section Oluştur',
          style: TextStyle(
            color: Colors.blueAccent,
            fontSize: 25.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      resizeToAvoidBottomPadding: false,
      backgroundColor: Colors.grey,
      body: new Stack(
        children: <Widget>[
          new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              new Container(
                height: 85.0,
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
                      padding: EdgeInsets.fromLTRB(40.0, 85.0, 40.0, 20.0),
                      child: new TextFormField(
                        //controller: username,
                        autofocus: true,
                        decoration: new InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            border: OutlineInputBorder(),
                            hintText: "Section Adı",
                            hintStyle: TextStyle(color: Colors.grey,
                            fontWeight: FontWeight.w900),
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
                    Container(
                      padding: EdgeInsets.fromLTRB(40.0, 10.0, 40.0, 1.0),
                      child: new TextFormField(
                        autofocus: true,
                        decoration: new InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            hintStyle: TextStyle(fontWeight: FontWeight.w900),
                            border: OutlineInputBorder(),
                            hintText: "Şifre",
                            contentPadding:
                                EdgeInsets.fromLTRB(5.0, 0.0, 5.0, 1.0)),
                        style: TextStyle(
                          color: Colors.black,
                          height: 1.8,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                        keyboardType: TextInputType.text,
                      ),
                    ),
                    SizedBox(height: 95.0),
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
                                left: 2.0, right: 2.0, bottom: 1.0, top: 1.0),
                            color: Colors.lightGreen,
                            child: Text('Oluştur',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 25.0,
                                  fontWeight: FontWeight.bold,
                                )),
                          ),
                        )),
                  ],
                ),
              ))
            ],
          )
        ],
      ),
    );
  }
}
