import 'dart:ffi';

import 'package:http/http.dart' as http;

class ApiHelper {
  static const String _baseUrl = "api.themoviedb.org";
  final String _apiKey = 'ee2c421224e99922536585b471146386';
  final String _language = 'es-ES';

  Future<String> getRequest(String endpoint, [int page = 1]) async {
    var url = Uri.https(_baseUrl, endpoint, {
      'api_key': _apiKey,
      'language': _language,
      'page': '$page'
    });

    final  response = await http.get(url);
    return response.body;
  }

  Future<String> postRequest(String endpoint, Array<dynamic> body, [int page = 1]) async {
    var url = Uri.https(_baseUrl, endpoint, {
      'api_key': _apiKey,
      'language': _language,
      'page': '$page',
      'body': body
    });

    final  response = await http.post(url);
    return response.body;
  }
//similar methods for GET, PUT, DELETE
}