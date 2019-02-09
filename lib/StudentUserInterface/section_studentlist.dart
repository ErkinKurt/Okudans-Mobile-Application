import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:okudans_mobile/StudentUserInterface/add_section.dart';
import 'package:okudans_mobile/BackendService/StudentOperations.dart';
import 'package:okudans_mobile/StudentUserInterface/take_attendance.dart';
import 'package:okudans_mobile/util/select_class.dart';

class StudentList extends StatefulWidget {
  StudentList({this.documentSnapshot});
  final documentSnapshot;
  @override
  State createState() => StudentListState(documentSnapshot: this.documentSnapshot);
}

class StudentListState extends State<StudentList> {
  StudentListState({this.documentSnapshot});
  DocumentSnapshot documentSnapshot;
  Widget buildListItem(BuildContext context, DocumentSnapshot document) {
    // TODO: implement build
    return  Container(
          decoration: BoxDecoration(color: Colors.blueAccent, border: new Border.all(color: Colors.grey, width: 3)),
          child: ListTileTheme(
              child: ListTile(
                contentPadding: new EdgeInsets.all(10.0),
                title: Row(
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        document.data['StudentName'],
                        style: Theme.of(context).textTheme.headline,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        document.data['LastPayment'],
                        style: Theme.of(context).textTheme.headline,
                      ),
                    )
                  ],
                ),
              )),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text('Students - Key: ' + documentSnapshot.documentID,
              style: TextStyle(
                color: Colors.blueAccent,
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
              )),
        ),
        backgroundColor: Colors.grey,
        body: StreamBuilder(
            stream: Firestore.instance.collection('sessions').document(documentSnapshot.documentID).collection('Students').snapshots(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) return const Text('Loading...');
              return ListView.builder(
                itemCount: snapshot.data.documents.length,
                itemBuilder: (context, index) =>
                    buildListItem(context, snapshot.data.documents[index]),
              );
            }));
  }
}
