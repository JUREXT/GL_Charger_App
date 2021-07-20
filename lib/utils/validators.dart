String emailValidator(String email) {
  String _msg;
  RegExp regex = new RegExp(
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
  if (email.isEmpty) {
     _msg = "Email is required!";
  } else if (!regex.hasMatch(email)) {
    _msg = "Please provide a valid email address!";
  }
  return _msg;
}

String passwordValidator(String password) {
  String _msg;
  if (password.isEmpty) {
    _msg = "Empty password!";
  } else if (password.length <= 5) {
    _msg = "Password is too short!";
  }
  return _msg;
}
