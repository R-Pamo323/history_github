import 'package:flutter/material.dart';

class ErrorData extends StatelessWidget {
  const ErrorData({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Image.asset(
          "assets/images/1_No Connection.png",
          fit: BoxFit.cover,
        ),
      ],
    );
  }
}
