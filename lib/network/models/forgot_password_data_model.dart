class ForgotPasswordDataModel {
  String resetPasswordToken;
  String password;

  ForgotPasswordDataModel({this.resetPasswordToken, this.password});

  ForgotPasswordDataModel.fromJson(Map<String, dynamic> json) {
    resetPasswordToken = json['resetPasswordToken'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['resetPasswordToken'] = this.resetPasswordToken;
    data['password'] = this.password;
    return data;
  }
}