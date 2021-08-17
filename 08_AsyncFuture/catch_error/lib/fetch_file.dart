import 'package:flutter/services.dart';

Future<String> fetchFileFromAssets(String assetsPath) {
  return rootBundle
      .loadString(assetsPath)
      .then((String file) => file.toString())
      .catchError((dynamic error) => 'No file found');
}
