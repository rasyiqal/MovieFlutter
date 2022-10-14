import 'package:flutter/material.dart';
import 'package:movie/data/shared_pref.dart';
import 'package:movie/pages/widget/ListItem_widget.dart';
import 'package:movie/theme/theme.dart';
import 'login_page.dart';
import 'widget/Upcoming_widget.dart';

class HomeScreen extends StatefulWidget {
  Function setTheme;
  HomeScreen({Key? key, required this.setTheme}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isDarkmode = SharedPref.pref?.getBool('isDarkmode') ?? false;

  @override
  Widget build(BuildContext context) {
    // String isDarkMode = SharedPref.pref?.getString('ini darkmode') ??
    //     "ini darkmode"; //shrdpref belum string jdi diubah k string
    // print(isDarkMode);
    return Scaffold(
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
                          style: TextStyle(
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
                    Container(
                      child: IconButton(
                        onPressed: () {
                          isDarkmode = !isDarkmode;
                          widget.setTheme(isDarkmode);
                        },
                        icon: Icon(Icons.light_mode),
                      ),
                    ),
                  ],
                ),
              ),
              Center(
                child: Container(
                  height: 60,
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.search,
                        size: 24,
                      ),
                      Container(
                        width: 200,
                        margin: EdgeInsets.only(
                          left: 24,
                        ),
                        child: TextFormField(
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: bold,
                          ),
                          decoration: InputDecoration(
                              hintText: 'Search',
                              hintStyle: TextStyle(
                                fontSize: 16,
                              ),
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              UpcomingMovie(),
              Container(
                padding: EdgeInsets.symmetric(
                  vertical: 16,
                ),
                height: MediaQuery.of(context).size.height *
                    0.7, //ngambil nilai tinggi total hp, diambil 70%
                child: GridView.builder(
                  itemCount: item.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  itemBuilder: (context, index) => Container(
                    child: Column(
                      children: [
                        Image.asset(item[index].gambar),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          item[index].nama,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Card cardku() {
  //   return Card(
  //     child: Column(
  //       children: [
  //         Container(
  //           width: 370,
  //           height: 320,
  //           decoration: BoxDecoration(
  //             borderRadius: BorderRadius.circular(20),
  //             image: DecorationImage(
  //                 image: AssetImage('assets/bromo.png'),
  //                 fit: BoxFit.fitWidth,
  //                 alignment: Alignment.topCenter),
  //           ),
  //         ),
  //         SizedBox(
  //           height: 8,
  //         ),
  //         Text(
  //           'data',
  //           style: TextStyle(
  //             fontSize: 24,
  //             fontWeight: bold,
  //           ),
  //           textAlign: TextAlign.start,
  //         ),
  //         SizedBox(
  //           height: 16,
  //         )
  //       ],
  //     ),
  //   );
  // }
}

//bikin icon appbar
// child; gesturdetc;ontap;child icon