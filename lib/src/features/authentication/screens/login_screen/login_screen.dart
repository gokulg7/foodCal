import 'package:flutter/material.dart';
import 'package:mini_proj/src/constants/colors.dart';
import 'package:mini_proj/src/constants/image_strings.dart';
import 'package:mini_proj/src/constants/sizes.dart';
import 'package:mini_proj/src/constants/text_string.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: primaryColor,
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(defaultSize),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image(
                  image: const AssetImage(splashTopIcon),
                  height: size.height * 0.2,
                ),
                Text(wellBak),
                Text(loginAcc),
                Form(
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextFormField(
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.person_outline_outlined),
                            labelText: uName,
                            hintText: uName,
                            border: OutlineInputBorder(),
                          ),
                        ),
                        const SizedBox(height: defaultSize),
                        TextFormField(
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.fingerprint),
                            labelText: uPassword,
                            hintText: uPassword,
                            border: OutlineInputBorder(),
                            suffixIcon: IconButton(
                              onPressed: null,
                              icon: Icon(Icons.remove_red_eye_sharp),
                            ),
                          ),
                        ),
                        const SizedBox(height: loginSpace),
                        Align(
                            alignment: Alignment.centerRight,
                            child: TextButton(
                                onPressed: () {}, child: Text(foPass))),
                        SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: accentColor,
                                  foregroundColor: darkColor),
                              onPressed: () {},
                              child: Text(login.toUpperCase()),
                            )),
                        const SizedBox(height: loginSpace),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text("OR"),
                            const SizedBox(height: loginSpace),
                            SizedBox(
                              width: double.infinity,
                              child: OutlinedButton.icon(
                                  icon: Image(
                                    image: AssetImage(googleIcon),
                                    width: 20.0,
                                  ),
                                  onPressed: () {},
                                  label: Text(google)),
                            ),
                          ],
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
