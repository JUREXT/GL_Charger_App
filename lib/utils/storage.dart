import 'package:get_storage/get_storage.dart';

class Storage {
  var storage;
  static const SESSION_DATA = 'session_data'; // null can be stored and checked

  Storage() {
    storage = GetStorage();
  }

  Future<void> write(String key, String value) async {
    await storage.write(key, value);
  }

  Future<String> read(String key) async {
    var val = await storage.read(key);
    return val;
  }

  Future<void> erase() async {
    await storage.erase();
  }

  Future<bool> hasSession() async {
    if (await storage.read(SESSION_DATA) == null) {
      return false;
    } else {
      return true;
    }
  }
}
