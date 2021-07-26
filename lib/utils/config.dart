import 'package:fimber/fimber.dart';
import 'package:get_storage/get_storage.dart';

class Config {
  static init() {
    Fimber.plantTree(DebugTree(useColors: true));
    initGetStorage();
  }

  static initGetStorage() async {
    await GetStorage.init();
  }
}
