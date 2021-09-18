import 'dart:async';

import 'package:app_carros/model/user_model.dart';
import 'package:app_carros/pages/home_page.dart';
import 'package:app_carros/services/api_response.dart';
import 'package:app_carros/services/login_api.dart';
import 'package:app_carros/utils/nav.dart';
import 'package:app_carros/widgets/button_widget.dart';

import 'package:app_carros/widgets/text_form_widget.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final tLogin = TextEditingController();
  final tSenha = TextEditingController();

  final _sController = StreamController<bool?>();

  final _focusSenha = FocusNode();

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();

    Future<UserModel?> future = UserModel.get();

    future.then((user) {
      if (user != null) {
        push(context, HomePage(), replecement: true);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Carros'),
        centerTitle: true,
      ),
      body: _body(size),
    );
  }

  _body(size) {
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextFormWidget(
                label: 'Login',
                placeHolder: 'Digite seu usuario',
                controller: tLogin,
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (value) {
                  FocusScope.of(context).requestFocus(_focusSenha);
                },
                validator: (text) {
                  if (text!.isEmpty) {
                    return 'Digite o seu Login';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              TextFormWidget(
                label: 'senha',
                placeHolder: 'Digite sua senha',
                controller: tSenha,
                textInputAction: TextInputAction.go,
                focusNode: _focusSenha,
                obscure: true,
                validator: (text) {
                  if (text!.isEmpty) {
                    return 'Digite uma senha';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              StreamBuilder<bool?>(
                  stream: _sController.stream,
                  builder: (context, snapshot) {
                    return ButtonWidget(
                      width: size.width * .95,
                      onPress: _onClickLogin,
                      height: 50,
                      showProgress: snapshot.data ?? false,
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }

  void _onClickLogin() async {
    bool? form = _formKey.currentState?.validate();

    if (!form!) {
      return;
    }

    String login = tLogin.text;
    String senha = tSenha.text;

    _sController.add(true);

    ApiResponse? response = await LoginApi.login(login, senha);
    if (response!.ok!) {
      UserModel user = response.result;
      print('>>>> $user <<<<');
      push(context, HomePage(), replecement: true);
    } else {
      _showDiolgError(context, response.msg);
    }

    _sController.add(false);
  }

  _showDiolgError(context, msg) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Não foi possivel fazer o Login: >>$msg',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 17,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            )),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
