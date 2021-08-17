import 'package:fimber/fimber.dart';
import 'package:get_storage/get_storage.dart';

class Config {
  static init() async {
    Fimber.plantTree(DebugTree(useColors: true));
    await initGetStorage();
  }

  static initGetStorage() async {
    await GetStorage.init();
  }
}
