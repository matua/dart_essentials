import 'package:flutter/services.dart';

Future<String> fetchFileFromAssets(String assetsPath) async {
  return rootBundle.loadString(assetsPath).then((String file) => file);
}

// Future<String> _loadAStudentAsset(String assetsPath) async {
//   return await rootBundle.loadString(assetsPath);
// }
