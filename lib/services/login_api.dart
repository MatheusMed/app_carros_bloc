import 'dart:convert';
import 'package:app_carros/model/user_model.dart';
import 'package:app_carros/services/api_response.dart';
import 'package:http/http.dart' as http;

class LoginApi {
  static Future<ApiResponse<UserModel?>?> login(
      String? login, String? senha) async {
    var url = Uri.parse('https://carros-springboot.herokuapp.com/api/v2/login');
    Map params = {
      "username": login,
      "password": senha,
    };
    //convertendo para encode
    String paramsEncode = json.encode(params);
    print('>> $paramsEncode');

    Map<String, String> headers = {
      "Content-type": "application/json",
    };
    // response
    var response = await http.post(url, body: paramsEncode, headers: headers);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    Map<String, dynamic> mapReponse = json.decode(response.body);

    if (response.statusCode == 200) {
      final user = UserModel.fromMap(mapReponse);

      user.save();

      return ApiResponse.ok(user);
    }

    return ApiResponse.error(mapReponse['error']);
  }
}
