import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class SpaceProvider extends ChangeNotifier {
  getRecomendedSpace() async {
    var result = await http
        .get(Uri.parse('https://bwa-cozy.herokuapp.com/recommended-spaces'));
    print(result.statusCode);
    print(result.body);
  }
}
