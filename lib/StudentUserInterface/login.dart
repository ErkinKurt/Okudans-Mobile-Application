import 'package:flutter/material.dart';
import './dashboard_instructor.dart';
import './class_sections.dart';
import 'package:flutter/services.dart';

class OkuDansApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return new MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: new ThemeData(primarySwatch: Colors.blue),
        home: new Login(),
        routes: <String, WidgetBuilder>{
          '/dashboard_instructor.dart': (BuildContext context) =>
              new DashboardInstructor(),
          '/class_sections.dart': (BuildContext context) => new Section()
        });
  }
}

class Login extends StatefulWidget {
  @override
  State createState() => LoginPageState();
}

class LoginPageState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: Colors.black,
      body: new Stack(
        children: <Widget>[
          new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              new Container(
                height: 85.0,
              ),
              new Container(
                height: 100.0,
                padding: EdgeInsets.only(left: 5.0, right: 5.0),
                child: new Image(
                  image: new AssetImage("assets/images/logo.png"),
                  fit: BoxFit.cover,
                ),
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
                        autofocus: true,
                        decoration: new InputDecoration(
                            fillColor: Colors.blueGrey,
                            filled: true,
                            border: OutlineInputBorder(),
                            hintText: "Kullanıcı Adı",
                            hintStyle: TextStyle(fontWeight: FontWeight.w900),
                            contentPadding:
                                EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 1.0)),
                        style: TextStyle(
                          height: 1.5,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                        keyboardType: TextInputType.emailAddress,
                      ),
                    ), // Email form field

                    Container(
                      padding: EdgeInsets.fromLTRB(40.0, 10.0, 40.0, 1.0),
                      child: new TextFormField(
                        autofocus: true,
                        decoration: new InputDecoration(
                            fillColor: Colors.blueGrey,
                            filled: true,
                            hintStyle: TextStyle(fontWeight: FontWeight.w900),
                            border: OutlineInputBorder(),
                            hintText: "Şifre",
                            contentPadding:
                                EdgeInsets.fromLTRB(5.0, 0.0, 5.0, 1.0)),
                        style: TextStyle(
                          height: 1.8,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                        keyboardType: TextInputType.text,
                        obscureText: true,
                      ),
                    ), //Password form field

                    SizedBox(height: 45.0),

                    Container(
                        alignment: Alignment(1.0, 1.0),
                        width: 325.0,
                        height: 50.0,
                        child: ButtonTheme(
                          minWidth: 150.0,
                          height: 100.0,
                          child: RaisedButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          DashboardInstructor()));
                            },
                            padding: EdgeInsets.only(
                                left: 2.0, right: 2.0, bottom: 1.0, top: 1.0),
                            color: Colors.lightGreen,
                            child: Text('Giriş',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 25.0,
                                  fontWeight: FontWeight.bold,
                                )),
                          ),
                        )),

                    SizedBox(height: 20.0),

                    Container(
                        alignment: Alignment(0.8, 0.0),
                        padding: EdgeInsets.only(top: 15.0, left: 20.0),
                        child: InkWell(
                          child: Text(
                            'Şifremi Unuttum.',
                            style: TextStyle(
                              color: Colors.green,
                              fontSize: 19.0,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ))
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
