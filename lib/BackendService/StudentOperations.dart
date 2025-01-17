import 'package:cloud_firestore/cloud_firestore.dart';

class StudentOperations {

  //Firebase properties..
  Firestore db;
  CollectionReference sessionCollectionRef;
  CollectionReference sessionCollectionStudentRef;


  StudentOperations(){
    db = Firestore.instance;
    sessionCollectionRef = db.collection("sessions");
    sessionCollectionStudentRef = db.collection('sessions').document('1').collection('Students');
  }


  //TODO(ERKİN) Find a way to get a document with a query via transaction
  Future updateSession(Session session) async {
    sessionCollectionStudentRef.document(session.student.studentName).setData(session.student.toMap()).then((void v) => print("Error"));
  }

  Future<dynamic> updateTest(){
    final TransactionHandler updateTransaction = (Transaction transaction) async{
      final DocumentSnapshot ds = await transaction.get(sessionCollectionRef.document('1'));

      await transaction.set(ds.reference, {"Umut" : "bi hafta"});

      return {"updated" : true};
    };

    return db.runTransaction(updateTransaction).then((result) => result['updated'])
        .catchError((error){
      print('error: $error');
      return false;
    });
  }

}

class Session {
  String className;
  Timestamp sessionDate;
  String sessionId;

  Student student;

  List<Student> studentList;


  Session(this.className,this.student, this.sessionId);

  Map<int, dynamic> studentListToMap(){
    var map = new Map<int, dynamic>();
    map = studentList.asMap();
    return map;
  }

  Map<String, dynamic> toMap(){

    var map = new Map<String, dynamic>();
    map['className'] = className;
    map['sessionDate'] = sessionDate;

    return map;
  }

}

class Student {
  String lastPayment;
  String studentName;

  Student(this.studentName, this.lastPayment);

  Map<String, dynamic> toMap(){
    var map = new Map<String, dynamic>();
    map["LastPayment"] = lastPayment;
    map["StudentName"] = studentName;
    return map;
  }

}
