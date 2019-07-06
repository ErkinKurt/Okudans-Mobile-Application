import 'package:okudans_mobile/New/roles/person.dart';

class Student implements Person{
  @override
  String name;

  @override
  String phoneNumber;

  Student(this.name, this.phoneNumber);

}