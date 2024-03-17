import 'package:flutter/material.dart';
import 'package:mini_proj/src/features/authentication/screens/get_profile_screen/get_profile_screen.dart';
import 'package:mini_proj/src/features/authentication/screens/get_profile_screen/get_profile_screen2.dart';
import 'package:mini_proj/src/features/authentication/screens/login_screen/login_screen.dart';
import 'package:mini_proj/src/features/authentication/screens/main_tab/main_tab_view.dart';
import 'package:mini_proj/src/features/authentication/screens/signup_screen/signup_screen.dart';
import 'package:mini_proj/src/utils/themes/theme.dart';

void main() => runApp(const App());

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      home: const GetProfileScreen(),
    );
  }
}


