import 'package:flutter/material.dart';

class TextError extends StatelessWidget {
  final String? msg;
  TextError({this.msg});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        msg ?? "Tivemos problemas com a conexão",
        style: TextStyle(
          fontSize: 25,
          color: Colors.white,
        ),
      ),
    );
  }
}
