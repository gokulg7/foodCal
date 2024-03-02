import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox(
        width: media.width,
        child:  Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            Lottie.network(
              'https://lottie.host/32a38ac6-0b4c-4c35-b2b8-dafa717d6a3c/1eMfed2KKr.json',
              width: 200,
              height: 200,
            ),
            const Text(
              "AppName",
              style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.w700),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
