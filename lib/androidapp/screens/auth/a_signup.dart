import 'package:flightbag/androidapp/screens/auth/a_recover_password.dart';
import 'package:flightbag/androidapp/screens/auth/a_signin.dart';
import 'package:flightbag/androidapp/shared/android_auth_title.dart';
import 'package:flightbag/androidapp/shared/android_error_text.dart';
import 'package:flightbag/androidapp/shared/android_filled_button.dart';
import 'package:flightbag/androidapp/shared/android_flat_button.dart';
import 'package:flightbag/androidapp/shared/android_password_field.dart';
import 'package:flightbag/androidapp/shared/android_text_field.dart';
import 'package:flutter/material.dart';

class AndroidSignup extends StatefulWidget {
  const AndroidSignup({super.key});

  @override
  State<AndroidSignup> createState() => _AndroidSignupState();
}

class _AndroidSignupState extends State<AndroidSignup> {
  // EMAIL AND PASSWORD STATES
  String email = '';
  String password = '';
  String confirmPassword = '';

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
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              children: [
                SizedBox(
                  height: size.height * .4,
                  child: const Align(
                    alignment: Alignment.bottomLeft,
                    child: Padding(
                      padding: EdgeInsets.all(0),
                      child:
                          AndroidAuthTitle(title: 'Hola!\nWelcome to Flightbag.'),
                    ),
                  ),
                ),
                ConstrainedBox(
                  // height: size.height * 0.6,
                  constraints: BoxConstraints(
                    minHeight: size.height * 0.6,
                    // maxHeight: size.height * 0.6,
                  ),
                  child: Form(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const Text(
                          'Sign Up',
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
                            }, keyboardType: TextInputType.emailAddress,),
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

                        AndroidPasswordField(
                          hintText: 'Confirm Password...',
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
                              confirmPassword = val;
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
                          text: 'SIGN UP',
                          press: () {
                            if(password != confirmPassword){
                              setState(() {
                                error = 'Passwords do not match';
                              });
                              return;
                            }
                            print('Email: $email');
                            print('Password: $password');
                            print('Confirm Password: $confirmPassword');
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
                                  text: 'Signin',
                                  press: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const AndroidSignin()));
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
