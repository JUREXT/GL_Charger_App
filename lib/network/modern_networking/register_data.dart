class RegisterData {
  String username;
  String firstname;
  String lastname;
  String email;
  String password;

  RegisterData(
      {this.username,
        this.firstname,
        this.lastname,
        this.email,
        this.password});

  RegisterData.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    firstname = json['firstname'];
    lastname = json['lastname'];
    email = json['email'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['username'] = this.username;
    data['firstname'] = this.firstname;
    data['lastname'] = this.lastname;
    data['email'] = this.email;
    data['password'] = this.password;
    return data;
  }
}