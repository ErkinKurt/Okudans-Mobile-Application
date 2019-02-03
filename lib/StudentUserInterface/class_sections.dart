import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class Section extends StatefulWidget{
  @override
  State createState() => SectionState();
}

class SectionState extends State<Section> {
  String test= "test";

  Widget buildListItem(BuildContext context, DocumentSnapshot document) {
    // TODO: implement build
    return ListTile(
      title: Row(
        children: <Widget>[
          Expanded(
            child: Text(
              document['ClassName'],
              style: Theme.of(context).textTheme.headline,
            ),
          )
        ],
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
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
            //stream: Firestore.instance.collection('sessions').document('1').collection('Students').snapshots(),
            stream: Firestore.instance.collection('sessions').snapshots(),
            builder: (context, snapshot){
              if(!snapshot.hasData) return const Text('Loading...');
              return ListView.builder(
                itemCount: snapshot.data.documents.length,
                itemBuilder: (context,index) => buildListItem(context, snapshot.data.documents[index]),
              );
            })
          );
  }
}
