import 'package:flutter/material.dart';

class AndroidFlatButton extends StatelessWidget {
  final String text;
  final Function() press;
  final Color textColor;

  const AndroidFlatButton(
      {super.key,
      required this.text,
      required this.press,
      required this.textColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 0),
      child: TextButton(
        style: TextButton.styleFrom(foregroundColor: textColor),
        onPressed: press,
        child: Text(
          text,
          style:
              const TextStyle(fontStyle: FontStyle.italic, color: Colors.blue),
        ),
      ),
    );
  }
}