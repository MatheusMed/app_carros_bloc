import 'dart:convert';
import 'package:app_carros/utils/prefs.dart';
import 'package:flutter/foundation.dart';

class UserModel {
  final String? login;
  final String? nome;
  final String? urlFoto;
  final String? email;
  final String? token;
  final List<String?> roles;
  UserModel({
    this.login,
    this.nome,
    this.urlFoto,
    this.email,
    this.token,
    required this.roles,
  });

  UserModel copyWith({
    String? login,
    String? nome,
    String? urlFoto,
    String? email,
    String? token,
    List<String?>? roles,
  }) {
    return UserModel(
      login: login ?? this.login,
      nome: nome ?? this.nome,
      urlFoto: urlFoto ?? this.urlFoto,
      email: email ?? this.email,
      token: token ?? this.token,
      roles: roles ?? this.roles,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'login': login,
      'nome': nome,
      'urlFoto': urlFoto,
      'email': email,
      'token': token,
      'roles': roles,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      login: map['login'],
      nome: map['nome'],
      urlFoto: map['urlFoto'],
      email: map['email'],
      token: map['token'],
      roles: List<String?>.from(map['roles']),
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'UserModel(login: $login, nome: $nome, urlFoto: $urlFoto, email: $email, token: $token, roles: $roles)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserModel &&
        other.login == login &&
        other.nome == nome &&
        other.urlFoto == urlFoto &&
        other.email == email &&
        other.token == token &&
        listEquals(other.roles, roles);
  }

  @override
  int get hashCode {
    return login.hashCode ^
        nome.hashCode ^
        urlFoto.hashCode ^
        email.hashCode ^
        token.hashCode ^
        roles.hashCode;
  }

  static void clean() {
    Prefs.setString('user.prefs', "");
  }

  void save() {
    Prefs.setString('user.prefs', toJson());
  }

  static Future<UserModel?> get() async {
    String? json = await Prefs.getString("user.prefs");
    if (json!.isEmpty) return null;
    Map<String, dynamic> map = jsonDecode(json);
    UserModel user = UserModel.fromMap(map);
    return user;
  }
}
