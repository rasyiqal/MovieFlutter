import 'package:flutter/material.dart';
import 'package:movie/data/shared_pref.dart';
import 'package:movie/theme/theme.dart';
import 'pages/Onboarding_page.dart';
import 'pages/login_page.dart';
import 'pages/Home_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized(); //
  await SharedPref.init();
  runApp(const MyApp());
}

// void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeData themeData = ThemeData.light();

  void setTheme(bool isDarkmode) {
    setState(() {
      themeData = (isDarkmode) ? ThemeData.dark() : ThemeData.light();

      SharedPref.pref?.setBool('isDarkmode', isDarkmode);
    });
  }

  @override
  void initState() {
    bool isDarkmode = SharedPref.pref?.getBool('isDarkmode') ?? false;
    setTheme(isDarkmode);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: themeData,
      routes: {
        '/': (context) => Onboarding_Page(setTheme: setTheme),
        'login': (context) => Login_Page(setTheme: setTheme),
        'home': (context) => HomeScreen(setTheme: setTheme),
      },
    );
  }
}
