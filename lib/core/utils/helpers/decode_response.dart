import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:klshimol_task/core/errors/exceptions.dart';

class DecodeResponse {

  static Map<String,dynamic> decode(http.Response response) {
    if (response.statusCode >= 200 && response.statusCode <= 299) {
      return json.decode(( response.body)) as Map<String,dynamic>;
    } else {
      final errorData = jsonDecode(response.body);
      String errorMessage = errorData['data']['error'];
      throw CustomException(message: errorMessage);
    }
  }
}
