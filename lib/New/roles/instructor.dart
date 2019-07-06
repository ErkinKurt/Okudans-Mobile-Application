import 'package:okudans_mobile/New/roles/person.dart';
import 'package:okudans_mobile/New/sessions/session.dart';

class Instructor implements Person{
  @override
  String name;
  
  @override
  String phoneNumber;

  List<Person> students;
  List<Session> sessions;

  Instructor(this.name, this.phoneNumber);
}