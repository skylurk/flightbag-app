import 'package:flightbag/androidapp/screens/auth/a_recover_password.dart';
import 'package:flightbag/androidapp/screens/auth/a_signup.dart';
import 'package:flightbag/androidapp/shared/android_auth_title.dart';
import 'package:flightbag/androidapp/shared/android_error_text.dart';
import 'package:flightbag/androidapp/shared/android_filled_button.dart';
import 'package:flightbag/androidapp/shared/android_flat_button.dart';
import 'package:flightbag/androidapp/shared/android_text_field.dart';
import 'package:flutter/material.dart';

import '../../shared/android_password_field.dart';

class AndroidSignin extends StatefulWidget {
  const AndroidSignin({super.key});

  @override
  State<AndroidSignin> createState() => _AndroidSigninState();
}

class _AndroidSigninState extends State<AndroidSignin> {
  // EMAIL AND PASSWORD STATES
  String email = '';
  String password = '';

  // LOADING AND ERROR STATES
  bool loading = false;
  String error = '';

  // GLOBAL FORM KEY
  final _formKey = GlobalKey<FormState>();

  bool showPassword = true;

  @override
  Widget build(BuildContext context) {
    // GET THE SCREEN SIZE
    Size size = MediaQuery.of(context).size;

    // LOADING TEXT
    String loadingText = 'Signing in...';

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: size.height * .4,
                  child: const Align(
                    alignment: Alignment.bottomLeft,
                    child: Padding(
                      padding: EdgeInsets.all(0),
                      child:
                          AndroidAuthTitle(title: 'Hi there!\nWelcome back.'),
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.6,
                  child: Form(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const Text(
                          'Sign In',
                          style: TextStyle(
                              fontFamily: 'SFPRODISPLAYMEDIUM', fontSize: 20),
                        ),
                        AndroidTextField(
                          hintText: 'Email...',
                          icon: Icons.email,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Enter a valid email';
                            }
                            return null;
                          },
                          onChanged: (val) {
                            setState(() {
                              email = val;
                            });
                          },
                          keyboardType: TextInputType.emailAddress,
                        ),
                        AndroidPasswordField(
                          hintText: 'Password...',
                          icon: Icons.lock_outlined,
                          validator: (value) {
                            if (value == null ||
                                value.isEmpty ||
                                value.length < 6) {
                              return 'Enter a valid password';
                            }
                            return null;
                          },
                          onChanged: (val) {
                            setState(() {
                              password = val;
                            });
                          },
                          suffixIcon: showPassword
                              ? Icons.visibility
                              : Icons.visibility_off,
                          obscureText: showPassword,
                          tap: () {
                            setState(() {
                              showPassword = !showPassword;
                            });
                          },
                        ),
                        AndroidFilledButton(
                          text: 'SIGN IN',
                          press: () {
                            print('Email: $email');
                            print('Password: $password');
                          },
                          color: Theme.of(context).colorScheme.secondary,
                          textColor: Theme.of(context).colorScheme.surface,
                        ),
                        AndroidErrorText(error: error),
                        Container(
                          padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              AndroidFlatButton(
                                  text: 'Register',
                                  press: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const AndroidSignup()));
                                  },
                                  textColor: Colors.green),
                              AndroidFlatButton(
                                  text: 'Forgot Password?',
                                  press: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const AndroidRecoverPassword()));
                                  },
                                  textColor: Colors.green),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
