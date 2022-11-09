import 'package:flutter/material.dart';
import 'package:movie/pages/Home_page.dart';
import 'package:movie/theme/theme.dart';
import 'package:movie/pages/login_page.dart';

class Onboarding_Page extends StatelessWidget {
  Function setTheme;
  Onboarding_Page({Key? key, required this.setTheme}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              iconTop(),
              SizedBox(
                height: 42,
              ),
              imgComic(),
              SizedBox(
                height: 32,
              ),
              textDesc(),
              SizedBox(
                height: 32,
              ),
              ButtonSignin(context),
              SizedBox(
                height: 12,
              ),
              ButtonSkip(context),
            ],
          ),
        ),
      ),
    );
  }

  Container iconTop() {
    return Container(
      // 
      margin: const EdgeInsets.only(top: 16),
      child: Image.asset(
        'assets/Marvel.png',
        height: 24,
        width: 80,
      ),
    );
  }

  Image imgComic() {
    return Image.asset(
      'assets/MVC.png',
      height: 180,
    );
  }

  Column textDesc() {
    return Column(
      children: [
        Container(
          child: Text(
            'All Your \nFavourite Marvel Story',
            style: TextStyle(
              fontSize: 24,
              fontWeight: bold,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(
          height: 12,
        ),
        Text(
          'Delicious as is or tossed with your \nfavorite ingredients',
          style: greyTextStyle.copyWith(
            fontSize: 16,
            fontWeight: bold,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Container ButtonSignin(context) {
    return Container(
      width: 300,
      height: 45,
      child: OutlinedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Login_Page(setTheme: setTheme),
            ),
          );
        },
        child: Text(
          'Login',
          style: TextStyle(color: Colors.white).copyWith(
            fontSize: 18,
            fontWeight: bold,
          ),
        ),
        style: OutlinedButton.styleFrom(
          backgroundColor: Colors.red,
          shadowColor: Colors.grey,
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
      ),
    );
  }

  Container ButtonSkip(context) {
    return Container(
      width: 300,
      height: 45,
      child: OutlinedButton(
        onPressed: () {
          Navigator.pushNamedAndRemoveUntil(context, 'home', (route) => false);
        },
        style: OutlinedButton.styleFrom(
          backgroundColor: kWhiteColor,
          shadowColor: Colors.grey,
          elevation: 2,
          side: BorderSide(
            color: Colors.grey,
            width: 2,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        child: Text(
          'Skip',
          style: TextStyle(color: Colors.black).copyWith(
            fontSize: 18,
            fontWeight: bold,
          ),
        ),
      ),
    );
  }
}
