import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:projeto_carros/pages/api_response.dart';
import 'package:projeto_carros/pages/usuarios.dart';

class LoginAPI {
  static Future<ApiResponse<Usuario>> login(String login, String senha) async {
    try {
      var url = 'https://carros-springboot.herokuapp.com/api/v2/login';
      Map params = {"username": login, "password": senha};
      Map<String, String> headers = {"content-type": "application/json"};

      String s = json.encode(params);

      var response = await http.post(url, body: s, headers: headers);
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      Map mapResponse = json.decode(response.body);
      if (response.statusCode == 200) {
        final user = Usuario.fromJson(mapResponse);

        return ApiResponse.ok(user);
      }
      return ApiResponse.error(mapResponse['error']);
    } catch (error, exception) {
      print('ERROR NO LOGIN $error > $exception');
      return ApiResponse.error('nao foi possivel fazer o login.');
    }
  }
}
