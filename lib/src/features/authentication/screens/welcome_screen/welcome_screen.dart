import 'package:flutter/material.dart';
import 'package:mini_proj/src/constants/colors.dart';
import 'package:mini_proj/src/constants/image_strings.dart';
import 'package:mini_proj/src/constants/sizes.dart';
import 'package:mini_proj/src/constants/text_string.dart';
import 'package:mini_proj/src/features/authentication/screens/login_screen/login_screen.dart';
import 'package:mini_proj/src/features/authentication/screens/signup_screen/signup_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(defaultSize),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image(
              image: AssetImage(splashImage),
              height: height * 0.6,
            ),
            Column(
              children: [
                Text(appName),
                Text(
                  appTagLine,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            OutlinedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SignupScreen()),
                  );
                },
                style: OutlinedButton.styleFrom(
                    foregroundColor: secondaryColor,
                    backgroundColor: primaryColor,
                    side: BorderSide(color: secondaryColor),
                    padding: EdgeInsets.symmetric(vertical: buttonHeight)),
                child: Text("Start")),
            TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                        const LoginScreen()),
                  );
                },
                child: Text.rich(TextSpan(children: [
                  TextSpan(text: alreadyAccount),
                  TextSpan(text: login.toUpperCase())
                ])))
          ],
        ),
      ),
    );
  }
}
