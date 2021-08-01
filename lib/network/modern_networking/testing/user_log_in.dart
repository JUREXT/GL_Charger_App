class UserLogIn {
  UserLogIn._();
  factory UserLogIn.success(dynamic data) = UserLogInSuccessState;
  factory UserLogIn.error(dynamic data) = UserLogInErrorState;
}

class UserLogInErrorState extends UserLogIn {
  UserLogInErrorState(this.data): super._();
  final dynamic data;
}

class UserLogInSuccessState extends UserLogIn {
  UserLogInSuccessState(this.data): super._();
  final dynamic data;
}