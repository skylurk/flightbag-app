import 'package:flightbag/androidapp/screens/auth/a_signin.dart';
import 'package:flightbag/androidapp/screens/auth/a_signup.dart';
import 'package:flightbag/androidapp/screens/messages/a_success_page.dart';
import 'package:flightbag/androidapp/shared/android_auth_title.dart';
import 'package:flightbag/androidapp/shared/android_error_text.dart';
import 'package:flightbag/androidapp/shared/android_filled_button.dart';
import 'package:flightbag/androidapp/shared/android_flat_button.dart';
import 'package:flightbag/androidapp/shared/android_text_field.dart';
import 'package:flutter/material.dart';

class AndroidRecoverPassword extends StatefulWidget {
  const AndroidRecoverPassword({super.key});

  @override
  State<AndroidRecoverPassword> createState() => _AndroidRecoverPasswordState();
}

class _AndroidRecoverPasswordState extends State<AndroidRecoverPassword> {
  // EMAIL AND PASSWORD STATES
  String email = '';
  String password = '';

  // LOADING AND ERROR STATES
  bool loading = false;
  String error = '';

  // GLOBAL FORM KEY
  final _formKey = GlobalKey<FormState>();
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: size.height * .4,
                    child: const Align(
                      alignment: Alignment.bottomLeft,
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: AndroidAuthTitle(
                            title: 'Hello there!\nRecover Password.'),
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
                            'Reset Password',
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
                          AndroidFilledButton(
                            text: 'RESET',
                            press: () {
                              print('Email: $email');
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
                                    text: 'Sign In?',
                                    press: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const AndroidSignin()));
                                    },
                                    textColor: Colors.green),
                                AndroidFlatButton(
                                    text: 'Success',
                                    press: () {
                                      navigateToMessagePage(
                                          context,
                                          'Successfully Reset',
                                          'Your password has been reset successfully.',
                                          Icons.check_circle,
                                          Icons.home_outlined);
                                      // navigateToMessagePage(context, 'success',
                                      //     'Form submitted successfully');
                                      // Navigator.push(
                                      //     context,
                                      //     MaterialPageRoute(
                                      //         builder: (context) =>
                                      //             const AndroidSuccessPage()));
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
        ));
  }
}

void navigateToMessagePage(BuildContext context, String successTitle,
    String successMessage, IconData successIcon, IconData successButtonIcon) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => AndroidSuccessPage(
        successTitle: successTitle,
        successMessage: successMessage,
        successIcon: successIcon,
        successButtonIcon: successButtonIcon,
        press: () {},
      ),
    ),
  );
}
