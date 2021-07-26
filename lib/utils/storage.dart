import 'package:get_storage/get_storage.dart';

class Storage {
  var storage;
  static const USERNAME = 'username';

  Storage() {
    storage = GetStorage();
  }

  void write(String key, String value) {
    storage.write(key, value);
  }

  String read(String key) {
    return storage.read(key);
  }

  void erase() {
    storage.erase();
  }
}
