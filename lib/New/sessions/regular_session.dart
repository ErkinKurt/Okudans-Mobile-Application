import 'package:okudans_mobile/New/sessions/session.dart';

class RegularSession extends Session{
  RegularSession() : super();

  withSessionName(String sessionName){
    this.sessionName = sessionName;
    return this;
  }

  RegularSession build(){
    final RegularSession session = new RegularSession();
    return session;
  }

  @override
  void deleteStudent() {
    // TODO: implement deleteStudent
    throw new Exception("Not Implemented");
  }
    
}