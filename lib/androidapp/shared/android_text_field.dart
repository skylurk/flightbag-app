import 'package:flutter/material.dart';

class AndroidTextField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;
  final String? Function(String?) validator;
  final TextInputType? keyboardType;
  const AndroidTextField(
      {super.key,
      required this.hintText,
      required this.icon,
      required this.onChanged,
      required this.validator,
      required this.keyboardType});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      width: size.width * .9,
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(10)),
      child: TextFormField(
        validator: validator,
        onChanged: onChanged,
        keyboardType: keyboardType,
        decoration: InputDecoration(
            hintText: hintText, border: InputBorder.none, icon: Icon(icon)),
      ),
    );
  }
}
