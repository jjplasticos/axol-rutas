abstract class UserState {
  UserState ();

  bool iconState(bool isOpen){
    return isOpen;
  }

  String loginState(){
    return 'Estado de login';
  }
}

class IconState extends UserState{
  bool isOpen(){
    return true;
  }

  bool isClose(){
    return false;
  }
}

class AuthState extends UserState{
  String log(){
    return 'En registro';
  }


}