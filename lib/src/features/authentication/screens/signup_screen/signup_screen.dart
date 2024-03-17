import 'package:flutter/material.dart';
import 'package:mini_proj/src/common_widgets/highlighted_rtextfield.dart';
import 'package:mini_proj/src/constants/sizes.dart';
import 'package:mini_proj/src/constants/colors.dart';
import 'package:mini_proj/src/constants/image_strings.dart';
import 'package:mini_proj/src/constants/text_string.dart';
import 'package:mini_proj/src/features/authentication/screens/get_profile_screen/get_profile_screen.dart';
import 'package:mini_proj/src/features/authentication/screens/login_screen/login_screen.dart';
import '../../../../common/validation/validation.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final formField = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final nameController = TextEditingController();
  final passController = TextEditingController();
  final confPassController = TextEditingController();
  bool passToggle = true;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: TColor.white,
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
                const Text(hey, style: TextStyle(color: Colors.black),),
                const Text(create, style: TextStyle(color: Colors.black),),
                Form(
                  key: formField,
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        HighlightRoundTextField(
                            keyboardType: TextInputType.text,
                            controller: nameController,
                            labelText: uName,
                            prefixIcon:
                                const Icon(Icons.person_outline_outlined, color: Colors.black,),
                            validator: Validation.validateUsername),
                        const SizedBox(height: defaultSize),
                        HighlightRoundTextField(
                            keyboardType: TextInputType.emailAddress,
                            controller: emailController,
                            labelText: email,
                            prefixIcon: const Icon(Icons.email_outlined, color: Colors.black,),
                            validator: Validation.validateEmail),
                        const SizedBox(height: defaultSize),
                        TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          controller: passController,
                          obscureText: passToggle,
                          validator: Validation.validatePassword,
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 20, horizontal: 20),
                            prefixIcon: const Icon(Icons.fingerprint, color: Colors.black,),
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
                        const SizedBox(height: defaultSize),
                        TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          controller: confPassController,
                          obscureText: passToggle,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Enter Password";
                            } else if (value != passController.text) {
                              return 'Passwords do not match';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 20, horizontal: 20),
                            prefixIcon: const Icon(Icons.fingerprint, color: Colors.black,),
                            labelText: confPass,
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
                        SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: accentColor,
                                  foregroundColor: darkColor),
                              onPressed: () {
                                if (formField.currentState!.validate()) {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const GetProfileScreen()),
                                  );
                                }
                              },
                              child: Text(
                                signUp.toUpperCase(),
                                style: const TextStyle(
                                  color: whiteColor,
                                ),
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
                                  const TextSpan(text: alreadyAccount),
                                  TextSpan(text: login.toUpperCase())
                                ])))
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
