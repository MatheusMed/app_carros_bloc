import 'dart:convert';

import 'package:app_carros/model/carros_model.dart';
import 'package:app_carros/model/user_model.dart';
import 'package:http/http.dart' as http;

class TipoCarro {
  static final String esportivos = "esportivos";
  static final String classicos = "classicos";
  static final String luxo = "luxo";
}

class CarroApi {
  static Future<List<CarrosModel?>> getCarros(String tipo) async {
    UserModel? user = await UserModel.get();

    var url = Uri.parse(
        'https://carros-springboot.herokuapp.com/api/v2/carros/tipo/$tipo');

    Map<String, String> headers = {
      "Content-type": "application/json",
      "Authorization": "Bearer ${user!.token}",
    };

    print('GET >>$url');

    var response = await http.get(url, headers: headers);

    List<dynamic> list = jsonDecode(response.body);

    List<CarrosModel> carros =
        list.map((data) => CarrosModel.fromMap(data)).toList();

    return carros;
  }
}
