import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final double? width;
  final double? height;
  final void Function()? onPress;

  final bool showProgress;

  ButtonWidget(
      {this.height,
      required this.onPress,
      this.width,
      this.showProgress = false});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          backgroundColor: Colors.grey[700],
        ),
        onPressed: onPress,
        child: showProgress
            ? Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                ),
              )
            : Text(
                'Login',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
      ),
    );
  }
}
