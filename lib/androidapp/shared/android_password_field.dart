import 'package:flutter/material.dart';

class AndroidPasswordField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final IconData suffixIcon;
  final bool obscureText;
  final Function() tap;
  // final TextEditingController controller;
  final ValueChanged<String> onChanged;

  const AndroidPasswordField(
      {super.key,
      required this.hintText,
      required this.icon,
      required this.onChanged,
      // required this.controller,
      required this.suffixIcon, required String? Function(dynamic value) validator, required this.obscureText, required this.tap});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      width: size.width * 0.9,
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(10)),
      child: TextFormField(
        // controller: controller,
        obscureText: obscureText,
        onChanged: onChanged,
        decoration: InputDecoration(
            hintText: hintText,
            border: InputBorder.none,
            icon: Icon(icon),
            suffixIcon: GestureDetector( onTap: tap, child: Icon(suffixIcon))),
      ),
    );
  }
}