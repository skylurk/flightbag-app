import 'package:flightbag/androidapp/screens/a_splash.dart';
import 'package:flightbag/theme/theme.dart';
import 'package:flightbag/theme/theme_provider.dart';
import 'package:flutter/material.dart';
import 'dart:io';

import 'package:provider/provider.dart';

void main() {
  if(Platform.isAndroid){
    // RUN ANDROID APP
    runApp(
      ChangeNotifierProvider(
        create: (context) => ThemeProvider(), 
        child: const AndroidApp(),
      ),
      
    );
  } else if(Platform.isIOS){
    // RUN IOS APP 
    runApp(const IosApp());
  }
  // runApp(const MyApp());
}

class AndroidApp extends StatelessWidget {
  const AndroidApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flightbag',
      // theme: Provider.of<ThemeProvider>(context).themeData,
      theme: lightMode,
      darkTheme: darkMode,
      debugShowCheckedModeBanner: false,
      home: const AndroidSplash(),
    );
  }
}



class IosApp extends StatelessWidget {
  const IosApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}


