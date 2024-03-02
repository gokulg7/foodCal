import 'package:flutter/material.dart';
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
        backgroundColor: primaryColor,
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(defaultSize),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image(
                  image: const AssetImage(sigNupGi),
                  height: size.height * 0.2,
                ),
                const Text(wellBak),
                const Text(loginAcc),
                Form(
                  key: formField,
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
                          validator: Validation.validateUsername,
                        ),
                        const SizedBox(height: defaultSize),
                        TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          controller: emailController,
                          decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.email_outlined),
                            labelText: email,
                            hintText: email,
                            border: OutlineInputBorder(),
                          ),
                          validator: Validation.validateEmail,
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
                          validator: Validation.validatePassword,
                        ),
                        const SizedBox(height: defaultSize),
                        TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          controller: confPassController,
                          obscureText: passToggle,
                          decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.fingerprint),
                            labelText: confPass,
                            hintText: confPass,
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
                          validator: (value){
                            if (value!.isEmpty) {
                              return "Enter Password";
                            }
                            else if (value != passController.text) {
                              return 'Passwords do not match';
                            }
                            return null;
                        },
                        ),
                        const SizedBox(height: loginGap),
                        SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: accentColor,
                                  foregroundColor: darkColor),
                              onPressed: () {
                                if (formField.currentState!.validate()) {
                                  print("Success");
                                }
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                      const GetProfileScreen()),
                                );
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
