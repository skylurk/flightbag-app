import 'package:flightbag/androidapp/screens/auth/a_signin.dart';
import 'package:flutter/material.dart';

class AndroidWrapper extends StatelessWidget {
  const AndroidWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      // Disable back gestures until the confirmation dialog is resolved
      canPop: false,
      onPopInvoked: (didPop) async {
        final shouldPop = await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Are you sure you want to exit?'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context, true), // Allow pop
                child: const Text('Yes'),
              ),
              TextButton(
                onPressed: () => Navigator.pop(context, false), // Cancel pop
                child: const Text('No'),
              ),
            ],
          ),
        );
        return shouldPop ?? false; // Return false to prevent accidental pop
      },
      child:  Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,

        body:  Center(  
          child: TextButton(onPressed: (){
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const AndroidSignin()));
          }, child: const Text("Go to login", style: TextStyle(color: Colors.black),)),
        ),
      ),
    );
  }
}