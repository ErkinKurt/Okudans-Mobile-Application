import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:okudans_mobile/StudentUserInterface/add_section.dart';
import 'package:okudans_mobile/BackendService/StudentOperations.dart';
import 'package:okudans_mobile/StudentUserInterface/take_attendance.dart';
import 'package:okudans_mobile/util/select_class.dart';

class Section extends StatefulWidget {
  @override
  State createState() => SectionState();
}

class SectionState extends State<Section> {
  DocumentSnapshot selectedSection;

  Widget buildListItem(BuildContext context, DocumentSnapshot document) {
    // TODO: implement build
    return GestureDetector(
        onTap: () {
          selectedSection = document;
          SelectClass(selectedSection, context);
        },
        child: Container(

          decoration: BoxDecoration(color: Colors.blueAccent, border: new Border.all(color: Colors.grey   , width: 3)),
          child: ListTileTheme(
              child: ListTile(
                contentPadding: new EdgeInsets.all(10.0),
                title: Row(
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        document.data['className'],
                        style: Theme.of(context).textTheme.headline,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        document.data['sessionDate'].toString().substring(0, 10),
                        style: Theme.of(context).textTheme.headline,
                      ),
                    )
                  ],
                ),
              )),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: <Widget>[
            new IconButton(
              tooltip: "Section Ekle",
              iconSize: 50.0,
              alignment: Alignment.topRight,
              color: Colors.blueAccent,
              icon: new Icon(Icons.add),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AddSection()));
              },
            ),
          ],
          backgroundColor: Colors.black,
          title: Text('Asuman',
              style: TextStyle(
                color: Colors.blueAccent,
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
              )),
        ),
        backgroundColor: Colors.grey,
        body: StreamBuilder(
            //stream: Firestore.instance.collection('sessions').document('$data.docum').collection('Students').snapshots(),
            stream: Firestore.instance.collection('sessions').snapshots(),
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
