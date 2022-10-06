import 'package:flutter/material.dart';
import 'package:movie/theme.dart';
import 'pages/Onboarding_page.dart';
import 'pages/login_page.dart';
import 'pages/Home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => Onboarding_Page(),
        'login': (context) => Login_Page(),
        'home': (context) => HomeScreen(),
      },
    );
  }
}
