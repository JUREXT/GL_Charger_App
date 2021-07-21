import 'dart:async';

import 'package:gl_charge_app/network/modern_networking/TestUser.dart';

import 'api_response.dart';
import 'repository.dart';

class SignInBloc {

  Repository _repository;

  StreamController _userStreamController;
  StreamSink<ApiResponse<TestUser>> get userSink => _userStreamController.sink;
  Stream<ApiResponse<TestUser>> get userStream => _userStreamController.stream;

  SignInBloc() {
    _userStreamController = StreamController<ApiResponse<TestUser>>();
    _repository = Repository();
  }

  getUser() async {
    userSink.add(ApiResponse.loading('Fetching User'));
    try {
      TestUser user = await _repository.fetchUser();
      userSink.add(ApiResponse.completed(user));
    } catch (e) {
      userSink.add(ApiResponse.error(e.toString()));
      print(e);
    }
  }

  dispose() {
    _userStreamController?.close();
  }
}
