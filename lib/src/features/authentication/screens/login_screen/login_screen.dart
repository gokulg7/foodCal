import 'package:flutter/material.dart';
import 'package:mini_proj/src/constants/colors.dart';
import 'package:mini_proj/src/constants/image_strings.dart';
import 'package:mini_proj/src/constants/sizes.dart';
import 'package:mini_proj/src/constants/text_string.dart';

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
                const Text(wellBak),
                const Text(loginAcc),
                Form(
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextFormField(
                          keyboardType: TextInputType.text,
                          controller: nameController,
                          decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.person_outline_outlined),
                            labelText: uName,
                            hintText: uName,
                            border: OutlineInputBorder(),
                          ),
                        ),
                        const SizedBox(height: defaultSize),
                        TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          controller: passController,
                          obscureText: passToggle,
                          decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.fingerprint),
                            labelText: uPassword,
                            hintText: uPassword,
                            border: const OutlineInputBorder(),
                            suffix: InkWell(
                              onTap: () {
                                setState(() {
                                  passToggle = !passToggle;
                                });
                              },
                              child: Icon(passToggle
                                  ? Icons.visibility_off
                                  : Icons.visibility),
                            ),
                          ),
                        ),
                        const SizedBox(height: loginSpace),
                        Align(
                            alignment: Alignment.centerRight,
                            child: TextButton(
                                onPressed: () {}, child: const Text(foPass))),
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
