import 'package:okudans_mobile/New/sessions/regular_session.dart';

 const String REGULAR_SESSION = 'REGULAR_CLASS';

abstract class Session {
  
  Session ();
  String sessionName;
  
  factory Session.fromTypeName(String typeName){
    if(typeName == REGULAR_SESSION){
      return RegularSession();
    }
    else {
      return null;
    }
  }
}