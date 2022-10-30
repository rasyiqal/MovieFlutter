import 'package:flutter/material.dart';
import 'package:movie/data/shared_pref.dart';
import 'package:movie/widget/ListItem_widget.dart';
import 'package:movie/theme/theme.dart';
import 'login_page.dart';
import '../widget/Upcoming_widget.dart';
import 'Page_1.dart';
import 'package:movie/widget/Popular_item.dart';

class HomeScreen extends StatefulWidget {
  Function setTheme;
  HomeScreen({Key? key, required this.setTheme}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isDarkmode = SharedPref.pref?.getBool('isDarkmode') ?? false;
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    Text(
      'Index 1: Business',
      style: optionStyle,
    ),
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
    Text(
      'Index 3: Settings',
      style: optionStyle,
    ),
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Halo'),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              isDarkmode = !isDarkmode;
              widget.setTheme(isDarkmode);
            },
            icon: Icon(Icons.light_mode),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: SizedBox(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 24,
                    horizontal: 24,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                    vertical: 32,
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
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Movie EX-Studio',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
                leading: Icon(Icons.home),
                title: const Text('HOME'),
                onTap: () => print('Tap Trash menu')),
            ListTile(
              leading: Icon(
                Icons.show_chart,
              ),
              title: const Text('Page_1'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Page1(
                        setTheme: widget.setTheme,
                      ),
                    ));
              },
            ),
            ListTile(
                leading: Icon(Icons.timer),
                title: const Text('My History'),
                onTap: () {}),
            new Divider(),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              trailing: new Icon(Icons.cancel),
              title: const Text('LOGOUT'),
              onTap: () {
                Navigator.popAndPushNamed(context, 'login');
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Business',
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'School',
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
            backgroundColor: Colors.blue,
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black,
        onTap: _onItemTapped,
      ),
    );
  }
}

//bikin icon appbar
// child; gesturdetc;ontap;child icon