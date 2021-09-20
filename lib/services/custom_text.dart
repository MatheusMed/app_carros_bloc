import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';

class CustomText extends StatelessWidget {
  final String txt;
  final Color? cor;
  final double? tamanhoFont;
  final bool? bold;
  final TextAlign? alinhamentoText;

  CustomText(
      {required this.txt,
      this.cor,
      this.tamanhoFont,
      this.bold = false,
      this.alinhamentoText});

  @override
  Widget build(BuildContext context) {
    return Text(
      txt,
      textAlign: alinhamentoText,
      style: TextStyle(
        color: cor,
        fontSize: tamanhoFont,
        fontWeight: bold != false ? FontWeight.bold : null,
      ),
    );
  }
}
