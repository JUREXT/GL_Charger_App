import 'package:fimber/fimber.dart';

class Config {
  static init() async  {
    Fimber.plantTree(DebugTree(useColors: true));
  }
}