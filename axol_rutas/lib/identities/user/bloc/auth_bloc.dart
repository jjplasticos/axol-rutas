class Login {
  Login(this.userName, this.password);

  final String userName;
  final String password;

  String loginLogic(){
    String a = '$userName b';
    return a;
  }
}

class Otherclass{
  void unaFuncion(){
    Login nuevoLogin = Login('u','p');
    String onPress;
    onPress = nuevoLogin.loginLogic();
  }
}