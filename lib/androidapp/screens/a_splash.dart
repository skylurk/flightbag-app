import 'package:flightbag/androidapp/screens/a_wrapper.dart';
import 'package:flightbag/assets/url_list.dart';
import 'package:flutter/material.dart';

class AndroidSplash extends StatefulWidget {
  const AndroidSplash({super.key});

  @override
  State<AndroidSplash> createState() => _AndroidSplashState();
}

class _AndroidSplashState extends State<AndroidSplash> {

  @override
  void initState() {
    super.initState();
    // ADD A DELAY OF 3 SECONDS
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const AndroidWrapper()),
      );
    });
  }
  
  @override
  Widget build(BuildContext context) {

    // GET THE URL LIST 
    String logoUrl = UrlList.splashLogo;
    String acuveraLogo = UrlList.acuveraLogo;
    //GET THE SCREEN SIZE 
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Stack(
        children: [
          Center(
            child: Image(image: NetworkImage(logoUrl), width: size.width * 0.4),
          ), 
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: const EdgeInsets.only(bottom: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Text('from'), 
                  const SizedBox(height: 10),
                  Image(image: NetworkImage(acuveraLogo), width: size.width * 0.2),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}