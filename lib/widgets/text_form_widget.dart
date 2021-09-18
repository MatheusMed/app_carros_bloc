import 'package:flutter/material.dart';

class TextFormWidget extends StatelessWidget {
  final String? label;
  final String? placeHolder;
  final bool? obscure;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final TextInputAction? textInputAction;
  final FocusNode? focusNode;
  final Function(String)? onFieldSubmitted;

  TextFormWidget({
    this.label,
    this.placeHolder,
    this.textInputAction,
    this.onFieldSubmitted,
    this.obscure = false,
    this.validator,
    this.focusNode,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: label,
        hintText: placeHolder,
        border: OutlineInputBorder(),
      ),
      obscureText: obscure!,
      validator: validator,
      textInputAction: textInputAction,
      controller: controller,
      keyboardAppearance: Brightness.dark,
      focusNode: focusNode,
      onFieldSubmitted: onFieldSubmitted,
    );
  }
}
