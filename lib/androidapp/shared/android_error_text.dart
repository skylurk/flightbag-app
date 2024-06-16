import 'package:flutter/material.dart';

class AndroidErrorText extends StatelessWidget {
  final String error;
  const AndroidErrorText({super.key, required this.error});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 2.0),
      child: Text(
        error,
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 14.0,
          color: Colors.red,
        ),
      ),
    );
  }
}