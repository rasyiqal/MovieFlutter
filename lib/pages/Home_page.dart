import 'package:flutter/material.dart';
import 'package:movie/api/model.dart';
import 'package:movie/data/shared_pref.dart';
import 'package:movie/service/remote_service.dart';
import 'SetTime_page.dart';

Future<void> main() async {
  /* WidgetFlutterBinding digunakan untuk berinteraksi dengan mesin Flutter.
  SharedPref.init() perlu memanggil kode asli untuk menginisialisasi, oleh karena itu
  perlu memanggil ensureInitialized() untuk memastikan terdapat instance yang bisa dijalankan */

  WidgetsFlutterBinding.ensureInitialized();
  await SharedPref.init();
  // runApp(const HomePage());
}

class HomeScreen extends StatefulWidget {
  Function setTheme;
  HomeScreen({Key? key, required this.setTheme}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ThemeData themeData = ThemeData.light();
  bool isDarkmode = SharedPref.pref?.getBool('isDarkmode') ?? false;
  int _selectedIndex = 0;

  RemoteService remoteService = RemoteService();

  @override
  void initState() {
    // TODO: implement initState
    remoteService.fecthDataUsers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text(
          'Marvel Comics',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
          ),
        ),
        elevation: 0,
        actions: <Widget>[
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SetTime(),
                ),
              );
            },
            icon: Icon(
              Icons.timer,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              right: 16,
            ),
            child: GestureDetector(
              child: IconButton(
                onPressed: () {
                  isDarkmode =
                      !isDarkmode; /* logic untuk membalik sebuah nilai darkmode
                  jika nilai awal true maka akan menjadi false
                  dan jika nilai awal false maka akan menjadi true */
                  widget.setTheme(isDarkmode);
                },
                icon: Icon(
                  Icons.light_mode,
                ),
              ),
            ),
          ),
        ],
      ),
      body: Container(
        child: FutureBuilder<List<Ramen>>(
          future: remoteService.fecthDataUsers(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              print(snapshot.data.toString());
              List<Ramen> ramen = snapshot.data;
              return ListView.builder(
                  padding: EdgeInsets.all(10),
                  itemCount: ramen.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      child: ListTile(
                        leading: CircleAvatar(
                          radius: 20,
                          backgroundImage: NetworkImage(ramen[index].imgUrl),
                        ),
                        title: Text(ramen[index].productName +
                            " " +
                            ramen[index].price.toString()),
                      ),
                      onTap: () {},
                    );
                  });
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: Colors.blueGrey,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.business,
              color: Colors.blueGrey,
            ),
            label: 'Business',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.school,
              color: Colors.blueGrey,
            ),
            label: 'School',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.settings,
              color: Colors.blueGrey,
            ),
            label: 'Settings',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blueGrey,
      ),
    );
  }
}
