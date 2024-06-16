import 'package:flutter/material.dart';

class AndroidSuccessPage extends StatelessWidget {

  final String successTitle;
  final String successMessage;
  final IconData successIcon;
  final IconData successButtonIcon;
  final Function() press;

  const AndroidSuccessPage({super.key, required this.successTitle, required this.successMessage, required this.successIcon, required this.successButtonIcon, required this.press});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        onPressed: () {
          print('object');
        },
        child: const Icon(Icons.home_outlined),
      ),
      body:  Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Icon(Icons.check_circle, size: 100, color: Colors.green),
          const SizedBox(height: 20),
          Text(
            successTitle,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontFamily: 'SFPRODISPLAYMEDIUM',
              fontWeight: FontWeight.bold,
              fontSize: 26,
            ),
          ),
          SizedBox(height: 20),
          Text(
            'Your password has been reset successfully.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'SFPRODISPLAYLIGHT',
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}