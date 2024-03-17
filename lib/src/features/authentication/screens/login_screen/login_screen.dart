import 'package:flutter/material.dart';
import 'package:mini_proj/src/common_widgets/highlighted_rtextfield.dart';
import 'package:mini_proj/src/constants/colors.dart';
import 'package:mini_proj/src/constants/image_strings.dart';
import 'package:mini_proj/src/constants/sizes.dart';
import 'package:mini_proj/src/constants/text_string.dart';
import 'package:mini_proj/src/features/authentication/screens/signup_screen/signup_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final nameController = TextEditingController();
  final passController = TextEditingController();
  bool passToggle = true;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(defaultSize),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image(
                  image: const AssetImage(splashImage),
                  height: size.height * 0.2,
                ),
                const Text(wellBak, style: TextStyle(color: Colors.black)),
                const Text(loginAcc, style: TextStyle(color: Colors.black)),
                Form(
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        HighlightRoundTextField(
                          keyboardType: TextInputType.text,
                          labelText: uName,
                          controller: nameController,
                          prefixIcon: const Icon(Icons.person_outline_outlined,
                              color: darkColor),
                        ),
                        const SizedBox(height: defaultSize),
                        TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          controller: passController,
                          obscureText: passToggle,
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 20, horizontal: 20),
                            prefixIcon:
                                const Icon(Icons.fingerprint, color: darkColor),
                            labelText: uPassword,
                            labelStyle: const TextStyle(color: Colors.black),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0),
                              // Adjust the radius as needed
                              borderSide:
                                  const BorderSide(color: Colors.transparent),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0),
                              // Adjust the radius as needed
                              borderSide: const BorderSide(
                                  color: Colors.blue), // Color when focused
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0),
                              // Adjust the radius as needed
                              borderSide: const BorderSide(
                                  color: Colors
                                      .transparent), // Color when enabled but not focused
                            ),
                            suffix: InkWell(
                              onTap: () {
                                setState(() {
                                  passToggle = !passToggle;
                                });
                              },
                              child: Icon(
                                passToggle
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                color: Colors.blue,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: loginSpace),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const SignupScreen()),
                                  );
                                },
                                child: const Text(newUse)),
                            TextButton(
                                onPressed: () {}, child: const Text(foPass)),
                          ],
                        ),
                        SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: accentColor,
                                  foregroundColor: darkColor),
                              onPressed: () {},
                              child: Text(
                                login.toUpperCase(),
                                style: const TextStyle(color: whiteColor),
                              ),
                            )),
                        const SizedBox(height: loginSpace),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Text("OR"),
                            const SizedBox(height: loginSpace),
                            SizedBox(
                              width: double.infinity,
                              child: OutlinedButton.icon(
                                  icon: const Image(
                                    image: AssetImage(googleIcon),
                                    width: 20.0,
                                  ),
                                  onPressed: () {},
                                  label: const Text(google)),
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
