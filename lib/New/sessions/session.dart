import 'package:okudans_mobile/New/roles/person.dart';
import 'package:okudans_mobile/New/roles/student.dart';

 const String REGULAR_SESSION = 'REGULAR_CLASS';

abstract class Session {
  
  String sessionName;
  List<Person> students; 
  
  Session();

  void addNewStudent(Student student){
    students.add(student);
  }

  void deleteStudent();

}