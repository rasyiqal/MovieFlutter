import 'dart:async';
import 'package:movie/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'Home_page.dart';

class Welocome extends StatefulWidget {
  Function setTheme;
  Welocome({Key? key, required this.setTheme}) : super(key: key);

  @override
  State<Welocome> createState() => _WelocomeState();

}

class _WelocomeState extends State<Welocome> {
  
   @override
  void initState() {
     Timer(Duration(seconds: 3), () {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => HomeScreen(setTheme: widget.setTheme),
            ),
            (route) => false);
      });
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: kWhiteColor,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Text(
                'Hello',
                style: greyTextStyle.copyWith(
                  fontSize: 24,
                  fontWeight: regular,
                ),
              ),
            ),
            Text(
              'Rasyiqal Fikri',
              style: greyTextStyle.copyWith(
                fontSize: 40,
                fontWeight: bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
