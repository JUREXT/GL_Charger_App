class User {
  int userId;
  String name;
  String surname;
  String email;
  String phone;
  String type;
  String token;
  String renewalToken;

  User();
  User.createUser(this.userId, this.name, this.email, this.phone, this.type, this.token, this.renewalToken);
  User.createUserByName(this.userId, this.name, this.surname);

  @override
  String toString() {
    return 'User{userId: $userId, name: $name, surname: $surname, email: $email, phone: $phone, type: $type, token: $token, renewalToken: $renewalToken}';
  }
}
