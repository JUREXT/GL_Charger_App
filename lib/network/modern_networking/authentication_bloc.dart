import 'dart:async';

import 'package:gl_charge_app/network/modern_networking/TestUser.dart';
import 'api_response.dart';
import 'repository.dart';
import 'sign_in_reponse .dart';

class AuthenticationBloc {

  Repository _repository;

  // For test
  StreamController _userStreamController;
  StreamSink<ApiResponse<TestUser>> get userSink => _userStreamController.sink;
  Stream<ApiResponse<TestUser>> get userStream => _userStreamController.stream;

  // Sign in user
  StreamController _signInStreamController;
  StreamSink<ApiResponse<SignInResponse>> get signInSink => _signInStreamController.sink;
  Stream<ApiResponse<SignInResponse>> get signInStream => _signInStreamController.stream;

  AuthenticationBloc() {
    _userStreamController = StreamController<ApiResponse<TestUser>>();
    _signInStreamController = StreamController<ApiResponse<SignInResponse>>();
    _repository = Repository();
  }

  getUser() async {
    userSink.add(ApiResponse.loading('Fetching User'));
    try {
      TestUser data = await _repository.fetchUser();
      userSink.add(ApiResponse.completed(data));
    } catch (e) {
      userSink.add(ApiResponse.error(e.toString()));
      print(e);
    }
  }

  signIn(String email, String password) async {
    signInSink.add(ApiResponse.loading('Signing In'));
    try {
      SignInResponse data = await _repository.signIn(email, password);
      signInSink.add(ApiResponse.completed(data));
    } catch (e) {
      signInSink.add(ApiResponse.error(e.toString()));
      print(e);
    }
  }

  dispose() {
    _userStreamController?.close();
    _signInStreamController?.close();
  }
}
