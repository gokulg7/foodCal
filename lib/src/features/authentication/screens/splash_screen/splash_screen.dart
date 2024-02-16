import 'package:flutter/material.dart';
import 'package:mini_proj/src/constants/colors.dart';
import 'package:mini_proj/src/constants/image_strings.dart';
import 'package:mini_proj/src/constants/sizes.dart';
import 'package:mini_proj/src/constants/text_string.dart';
import 'package:mini_proj/src/features/authentication/screens/home_screen/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  bool animate = false;

  @override
  void initState() {
    startAnimation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            AnimatedPositioned(
              duration: const Duration(milliseconds: 1600),
              top: animate ? 0 : -30,
              left: animate ? 0 : -30,
              child: Image(
                image: AssetImage(homeIcon),
                width: 100,
                height: 100,
              ),
            ),
            const Positioned(
              top: 100,
              left: defaultSize,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    appName,
                    style: TextStyle(fontFamily: 'IndieFlower'),
                  ),
                  Text(appTagLine)
                ],
              ),
            ),
            const Positioned(
              bottom: 150,
              width: 400,
              height: 400,
              child: Image(image: AssetImage(splashImage)),
            ),
            Positioned(
              bottom: 40,
              right: defaultSize,
              child: Container(
                width: splashContainerSize,
                height: splashContainerSize,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: primaryColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future startAnimation() async{
    await Future.delayed(Duration(milliseconds: 500));
    setState(() {
      animate = true;
    });
    await Future.delayed(Duration(milliseconds: 5000));
    //Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen));
  }
}
