import 'dart:async';

import 'package:app_carros/bloc/simple_bloc.dart';
import 'package:app_carros/model/user_model.dart';
import 'package:app_carros/services/api_response.dart';
import 'package:app_carros/services/login_api.dart';

class LoginBloc extends SimpleBloc<bool> {
  Future<ApiResponse<UserModel?>?> login(String? login, String? senha) async {
    add(true);
    var response = await LoginApi.login(login, senha);
    add(false);
    return response!;
  }
}
