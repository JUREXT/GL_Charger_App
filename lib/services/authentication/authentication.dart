// import 'package:get/get.dart';
// import 'package:gl_charge_app/network/modern_networking/repository.dart';
// import 'package:gl_charge_app/utils/log.dart';
// import 'package:gl_charge_app/utils/storage.dart';
// import 'session.dart';
//
// abstract class Authentication {
//   Future<Session> getSessionData();
//   Future<void> setSessionData();
//   Stream<Session> signIn(String email, String password);
//   Future<void> signOut();
// }
//
// class FakeAuthentication extends Authentication {
//   final tag = "FakeAuthentication";
//
//   Repository repository = Repository();
//
//   @override
//   Future<Session> getSessionData() async {
//     var storage = Storage();
//     await Future.delayed(Duration(seconds: 4));
//     //return Future<Session>.value(Session(accessToken: "accessToken", refreshToken: "refreshToken", email: "email", id: "id"));
//     return Future<Session>.value(Session(accessToken: null, refreshToken: null, email: null, id: null));
//   }
//
//   @override
//   Future<void> setSessionData() async {
//     var storage = Storage();
//   }
//
//   @override
//   Stream<Session> signIn(String email, String password) {
//     Log.d(tag, "signIn");
//     // await Future.delayed(Duration(seconds: 2));
//     // if (email.toLowerCase() != 'test@test.si' || password != 'test1234') {
//     //   //throw AuthenticationException(message: 'Wrong username or password');
//     // }
//     Log.d(tag, "getSessionData");
//     return getSessionData();
//   }
//
//   @override
//   Future<void> signOut() async {
//     var storage = Storage();
//   }
// }
//
// class AuthenticationException implements Exception {
//   final String message;
//
//   AuthenticationException({this.message = 'Unknown error occurred. '});
// }
