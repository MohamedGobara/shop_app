import 'package:shop_app/API/shop_login_model.dart';

abstract class login_states {}

class initializedstates extends login_states {}

class withinggetpost extends login_states {}

class successgetpost extends login_states {
  final shopLoginModel loginModel;

  successgetpost(this.loginModel);
}

class errorgetpost extends login_states {}

class withingsignup extends login_states {}

class successsignup extends login_states {}

class errorsignup extends login_states {}
