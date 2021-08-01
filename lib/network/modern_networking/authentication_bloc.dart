import 'dart:async';

import 'package:gl_charge_app/network/modern_networking/TestUser.dart';
import 'package:gl_charge_app/network/modern_networking/register_response.dart';
import 'api_response.dart';
import 'repository.dart';
import 'sign_in_response.dart';

class AuthenticationBloc {

  Repository _repository;

  // For test
  StreamController _userStreamController;
  StreamSink<ApiResponse<TestUser>> get userSink => _userStreamController.sink;
  Stream<ApiResponse<TestUser>> get userStream => _userStreamController.stream;

  // Sign In user
  StreamController _signInStreamController;
  StreamSink<ApiResponse<SignInResponse>> get signInSink => _signInStreamController.sink;
  Stream<ApiResponse<SignInResponse>> get signInStream => _signInStreamController.stream;

  // Register user
  StreamController _registerStreamController;
  StreamSink<ApiResponse<RegisterResponse>> get registerSink => _registerStreamController.sink;
  Stream<ApiResponse<RegisterResponse>> get registerStream => _registerStreamController.stream;

  AuthenticationBloc() {
    _userStreamController = StreamController<ApiResponse<TestUser>>();
    _signInStreamController = StreamController<ApiResponse<SignInResponse>>();
    _registerStreamController = StreamController<ApiResponse<RegisterResponse>>();
    _repository = Repository();
  }

  getUser() async {
    // userSink.add(ApiResponse.loading('Fetching User'));
    // try {
    //   TestUser data = await _repository.fetchUser();
    //   userSink.add(ApiResponse.success(data));
    // } catch (e) {
    //   userSink.add(ApiResponse.error(e.toString()));
    //   print(e);
    // }
  }

  signIn(String email, String password) async {
    // signInSink.add(ApiResponse.loading('Signing In'));
    // try {
    //   SignInResponse data = await _repository.signIn(email, password);
    //   signInSink.add(ApiResponse.success(data));
    // } catch (e) {
    //   signInSink.add(ApiResponse.error(e.toString())); // TODO: here later return an error to inform user what is wrong, parse error json and sen back and object
    //   print(e);
    // }
  }

  register(String username, String firstname, String lastname, String email, String password) async {
    // registerSink.add(ApiResponse.loading('Registering'));
    // try {
    //   RegisterResponse data = await _repository.register(username, firstname, lastname, email, password);
    //   registerSink.add(ApiResponse.success(data));
    // } catch (e) {
    //   registerSink.add(ApiResponse.error(e.toString())); // TODO: here later return an error to inform user what is wrong, parse error json and sen back and object
    //   print(e);
    // }
  }

  dispose() {
    _userStreamController?.close();
    _signInStreamController?.close();
    _registerStreamController?.close();
  }
}
