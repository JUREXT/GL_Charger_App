import 'package:gl_charge_app/utils/constants.dart';

import 'TestUser.dart';
import 'api_base_helper.dart';

class Repository {
  ApiBaseHelper _helper = ApiBaseHelper();

  Future<TestUser> fetchUser() async {
    final response = await _helper.get(Constants.userEndPoint);
    return TestUser.fromJson(response);
  }
}
