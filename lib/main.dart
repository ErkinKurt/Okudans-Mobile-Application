
import 'package:okudans_mobile/New/roles/student.dart';
import 'package:okudans_mobile/New/sessions/regular_session.dart';

import 'New/sessions/session.dart';

void main() {
  Session session = new RegularSession()
  ..sessionName = "mahmut"
  ..students = new List();
  Student student = new Student("Erkin", "phoneNumber");
  session.addNewStudent(student);
  var a = session.students.where((student) => student.name.contains("Erkin"));
  print(a.first.phoneNumber);
}