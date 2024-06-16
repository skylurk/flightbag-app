import 'package:flutter/material.dart';

class AndroidFilledButton extends StatelessWidget {
  final String text;
  final Function() press;
  final Color color, textColor;
  const AndroidFilledButton(
      {super.key,
      required this.text,
      required this.press,
      required this.color,
      required this.textColor});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * .9,
      margin: const EdgeInsets.symmetric(
        vertical: 10,
      ),
      child: TextButton(
        onPressed: press,
        style: TextButton.styleFrom(
            foregroundColor: textColor, backgroundColor: color,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            padding:
                const EdgeInsets.symmetric(vertical: 20, horizontal: 40)),
        child: Text(text),
      ),
    );
  }
}