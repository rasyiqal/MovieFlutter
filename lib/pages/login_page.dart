import 'package:flutter/material.dart';
import 'package:movie/data/shared_pref.dart';
import 'package:movie/pages/api/DummyData.dart';
import 'package:movie/theme/theme.dart';
import 'package:movie/pages/Home_page.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Login_Page extends StatefulWidget {
  Function setTheme;
  Login_Page({Key? key, required this.setTheme}) : super(key: key);

  @override
  State<Login_Page> createState() => _Login_PageState();
}

class _Login_PageState extends State<Login_Page> {
  late FToast fToast;
  final usernameController = TextEditingController(text: '');
  final passwordController = TextEditingController(text: '');

  bool isShowPassword = false;
  bool isPasswordWrong = false;
  bool isRememberMe = false;
  bool isLoading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fToast = FToast();
    fToast.init(context);
  }

  @override
  Widget build(BuildContext context) {
    SharedPref.pref?.setString('isDarkMode', 'ini darkmode');
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            horizontal: 24,
          ),
          child: Center(
            child: Column(
              children: [
                backButton(context),
                text(),
                usernameInput(),
                passwordInput(),
                SizedBox(
                  height: 80,
                ),
                Button(context),
                Container(
                  margin: EdgeInsets.symmetric(
                      // horizontal: 24,
                      ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Dont have any account ? ',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: regular,
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
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HomeScreen(setTheme: widget.setTheme),
                ),
              );
            },
            child: Text(
              'Skip',
              style: TextStyle(
                color: Colors.amber,
                fontSize: 16,
                fontWeight: bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container text() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        vertical: 24,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Welcome Back',
            style: TextStyle(
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

  Widget usernameInput() {
    return Container(
      height: 55,
      margin: const EdgeInsets.only(
        top: 48,
      ),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: kWhiteGreyColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: TextFormField(
        controller: usernameController,
        decoration: InputDecoration.collapsed(
          hintText: 'Username',
          hintStyle: greyTextStyle.copyWith(
            fontSize: 16,
            fontWeight: semiBold,
          ),
        ),
      ),
    );
  }

  Widget passwordInput() {
    return Column(
      children: [
        Container(
          height: 55,
          margin: const EdgeInsets.only(
            top: 24,
          ),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: kWhiteGreyColor,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            children: [
              Expanded(
                child: TextFormField(
                  obscureText: (isShowPassword) ? false : true,
                  controller: passwordController,
                  decoration: InputDecoration.collapsed(
                    hintText: 'Password',
                    hintStyle: greyTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: semiBold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget Button(context) {
    return Container(
      width: double.infinity,
      height: 55,
      child: TextButton(
        onPressed: () {
          setState(() {
            isLoading = true;
          });

          Future.delayed(const Duration(seconds: 2), () {
            setState(() {
              isLoading = false;
            });
            if (passwordController.text != 'admin' ||
                usernameController.text != 'admin') {
              setState(() {
                isPasswordWrong = true;
              });
              fToast.showToast(
                child: errorToast(),
                toastDuration: const Duration(seconds: 2),
                gravity: ToastGravity.BOTTOM,
              );
            } else {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomeScreen(setTheme: widget.setTheme),
                  ),
                  (route) => false);
              isLogin = true;
            }
          });
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

  Widget errorToast() {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: kRedColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        'Username atau password Salah',
        style: whiteTextStyle.copyWith(
          fontSize: 16,
          fontWeight: semiBold,
        ),
      ),
    );
  }
}
