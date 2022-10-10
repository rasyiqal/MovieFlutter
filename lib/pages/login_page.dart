import 'package:flutter/material.dart';
import 'package:movie/data/shared_pref.dart';
import 'package:movie/theme.dart';
import 'package:movie/pages/Home_page.dart';

class Login_Page extends StatelessWidget {
  const Login_Page({super.key});

  @override
  Widget build(BuildContext context) {
    SharedPref.pref?.setString('isDarkMode', 'ini darkmode');
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              backButton(context),
              text(),
              MailPass(),
              SizedBox(
                height: 150,
              ),
              Button(context),
              Container(
                margin: EdgeInsets.symmetric(
                  horizontal: 24,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Dont have any account ? ',
                      style: blackAccentTextStyle.copyWith(
                        fontSize: 16,
                        fontWeight: bold,
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'Register',
                        style: TextStyle(
                          color: Colors.amber,
                          fontSize: 16,
                          fontWeight: bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container backButton(context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 16,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ButtonBar(
            children: [
              IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/');
                },
                icon: Icon(Icons.arrow_back),
              ),
            ],
          ),
          // TextButton(
          //   onPressed: () {
          //     Navigator.push(
          //       context,
          //       MaterialPageRoute(
          //         builder: (context) => HomeScreen(setTheme: setTheme),
          //       ),
          //     );
          //   },
          //   child: Text(
          //     'Skip',
          //     style: TextStyle(
          //       color: Colors.amber,
          //       fontSize: 16,
          //       fontWeight: bold,
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }

  Container text() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: 24,
        vertical: 24,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Welcome Back',
            style: blackAccentTextStyle.copyWith(
              fontSize: 24,
              fontWeight: bold,
            ),
            textAlign: TextAlign.start,
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            'Login to your account',
            style: greyTextStyle.copyWith(
              fontSize: 16,
              fontWeight: bold,
            ),
          ),
        ],
      ),
    );
  }

  Container MailPass() {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 24,
        horizontal: 24,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Email',
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontWeight: bold,
            ),
          ),
          SizedBox(
            height: 16,
          ),
          TextFormField(
            initialValue: 'Email',
            style: TextStyle(
              color: Colors.grey,
            ),
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(
                horizontal: 24,
                vertical: 24,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
          ),
          SizedBox(
            height: 16,
          ),
          Text(
            'Password',
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontWeight: bold,
            ),
          ),
          SizedBox(
            height: 16,
          ),
          TextFormField(
            initialValue: 'Password',
            style: TextStyle(
              color: Colors.grey,
            ),
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(
                horizontal: 24,
                vertical: 24,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container Button(context) {
    return Container(
      width: double.infinity,
      height: 55,
      padding: EdgeInsets.symmetric(
        horizontal: 24,
      ),
      child: TextButton(
        onPressed: () {
          Future.delayed(const Duration(seconds: 2));
          Navigator.pushReplacementNamed(context, 'home');
        },
        child: Text(
          'Login',
          style: whiteTextStyle.copyWith(
            fontSize: 20,
            fontWeight: bold,
          ),
        ),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.amber),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
        ),
      ),
    );
  }
}
