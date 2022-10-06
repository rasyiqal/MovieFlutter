import 'package:flutter/material.dart';
import 'package:movie/theme.dart';
import 'login_page.dart';
import 'widget/Upcoming_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kDarkBackgroundColor,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 24,
                  horizontal: 24,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text(
                          'Hello Fikri',
                          style: whiteTextStyle.copyWith(
                            fontSize: 24,
                            fontWeight: bold,
                          ),
                          textAlign: TextAlign.start,
                        ),
                        Text(
                          'What to watch ?',
                          style: greyTextStyle.copyWith(
                            fontSize: 16,
                            fontWeight: semiBold,
                          ),
                          textAlign: TextAlign.start,
                        ),
                      ],
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: Image.asset(
                        'assets/Items1.png',
                        height: 60,
                        width: 60,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 60,
                padding: EdgeInsets.all(16),
                margin: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  color: kBlackColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.search,
                      color: kWhiteColor,
                      size: 24,
                    ),
                    Container(
                      width: 200,
                      margin: EdgeInsets.only(
                        left: 24,
                      ),
                      child: TextFormField(
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: bold,
                        ),
                        decoration: InputDecoration(
                          hintText: 'Search',
                          hintStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              UpcomingMovie(),
            ],
          ),
        ),
      ),
    );
  }

  Card cardku() {
    return Card(
      child: Column(
        children: [
          Container(
            width: 370,
            height: 320,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                  image: AssetImage('assets/bromo.png'),
                  fit: BoxFit.fitWidth,
                  alignment: Alignment.topCenter),
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            'data',
            style: TextStyle(
              fontSize: 24,
              fontWeight: bold,
            ),
            textAlign: TextAlign.start,
          ),
          SizedBox(
            height: 16,
          )
        ],
      ),
    );
  }
}

//bikin icon appbar
// child; gesturdetc;ontap;child icon