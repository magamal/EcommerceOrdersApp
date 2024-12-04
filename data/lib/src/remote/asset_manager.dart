import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';

@injectable
class AssetManager {
  Future<String> loadString(String path) {
    return rootBundle.loadString(path);
  }
}
