import 'package:flutter/material.dart';
import 'package:movie/pages/Home_page.dart';
import 'package:movie/theme.dart';
import 'package:movie/pages/login_page.dart';

class Onboarding_Page extends StatelessWidget {
  const Onboarding_Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kDarkBackgroundColor,
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              iconTop(),
              imgRamen(),
              SizedBox(
                height: 24,
              ),
              textDesc(),
              SizedBox(
                height: 40,
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
      padding: const EdgeInsets.symmetric(
        vertical: 24,
      ),
      margin: const EdgeInsets.only(top: 16),
      child: Image.asset('assets/Logo.png'),
    );
  }

  Image imgRamen() {
    return Image.asset('assets/Splash_1.png');
  }

  Column textDesc() {
    return Column(
      children: [
        Container(
          child: Text(
            'All Your \nFavourite Ramen',
            style: whiteGreyTextStyle.copyWith(
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
      child: TextButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Login_Page(),
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
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.black26),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                  30,
                ),
              ),
            )),
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
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(kWhiteColor),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
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
