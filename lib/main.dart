import 'package:flutter/material.dart';
import 'package:movie/data/shared_pref.dart';
import 'package:movie/pages/Home_page.dart';
import 'package:movie/pages/SetTime_page.dart';


Future<void> main() async {
  /* WidgetFlutterBinding digunakan untuk berinteraksi dengan mesin Flutter.*/
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPref
      .init(); /*SharedPref.init() perlu memanggil kode asli untuk menginisialisasi oleh karena itu 
  perlu memanggil ensureInitialized() untuk memastikan terdapat instance yang bisa dijalankan */
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeData themeData = ThemeData.light();

  void setTheme(bool isDarkmode) {
    /* fungsi mengubah tema sesuai inputan parameter */
    setState(() {
      themeData = (isDarkmode) ? ThemeData.dark() : ThemeData.light();
      SharedPref.pref?.setBool('isDarkmode', isDarkmode);
    });
  }

  @override
  void initState() {
    /* default / tema awal dibuat tidak gelap (isDarkmode = false) */
    bool isDarkmode = SharedPref.pref?.getBool('isDarkmode') ?? false;
    setTheme(isDarkmode);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: themeData,
      routes: {
        // '/': (context) => Onboarding_Page(setTheme: setTheme),
        // 'welcome':(context) => Welocome(setTheme: setTheme),
        // 'login': (context) => Login_Page(setTheme: setTheme),
        '/': (context) => HomeScreen(setTheme: setTheme),
        'time': (context) => SetTime(),
      },
    );
  }
}
