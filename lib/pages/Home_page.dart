import 'dart:html';
import 'package:flutter/material.dart';
import 'package:movie/api/model.dart';
import 'package:movie/data/shared_pref.dart';
import 'package:movie/service/remote_service.dart';
import 'package:movie/theme/theme.dart';
import 'SetTime_page.dart';
import 'package:image_card/image_card.dart';

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
          'My Ramene',
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
              Icons.alarm,
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
                  itemCount: ramen.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      child: Card(
                        margin: EdgeInsets.only(
                          top: 8,
                          right: 8,
                          left: 8,
                          bottom: 110,
                        ),
                        elevation: 6.0,
                        child: Column(
                          children: [
                            ListTile(
                              title: Text(
                                ramen[index].productName,
                                style: blackTextStyle.copyWith(
                                  fontSize: 16,
                                  fontWeight: bold,
                                ),
                              ),
                              subtitle: Text(
                                ramen[index].price.toString(),
                                style: greyTextStyle.copyWith(
                                  fontSize: 14,
                                  fontWeight: bold,
                                ),
                              ),
                              trailing: Icon(Icons.favorite_outline),
                            ),
                            Container(
                              height: 200.0,
                              child: Ink.image(
                                image: NetworkImage(ramen[index].imgUrl),
                                fit: BoxFit.cover,
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(16.0),
                              alignment: Alignment.centerLeft,
                              child: Text(ramen[index].description),
                            ),
                            ButtonBar(
                              children: [
                                TextButton(
                                  child: const Text('DETAIL'),
                                  onPressed: () {/* ... */},
                                ),
                                TextButton(
                                  child: const Text('BUY'),
                                  onPressed: () {/* ... */},
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
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
              Icons.food_bank,
              color: Colors.blueGrey,
            ),
            label: 'Business',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.add_chart,
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

  Card _CardWidget() {
    return Card(
      margin: EdgeInsets.only(
        top: 8,
        right: 8,
        left: 8,
        bottom: 110,
      ),
      elevation: 6.0,
      child: Column(
        children: [
          ListTile(
            title: Text('heading'),
            subtitle: Text('data'),
            trailing: Icon(Icons.favorite_outline),
          ),
          Container(
            height: 200.0,
            child: Ink.image(
              image: AssetImage('assets/bromo.png'),
              fit: BoxFit.cover,
            ),
          ),
          Container(
            padding: EdgeInsets.all(16.0),
            alignment: Alignment.centerLeft,
            child: Text('supportingText'),
          ),
          ButtonBar(
            children: [
              TextButton(
                child: const Text('CONTACT AGENT'),
                onPressed: () {/* ... */},
              ),
              TextButton(
                child: const Text('LEARN MORE'),
                onPressed: () {/* ... */},
              )
            ],
          ),
        ],
      ),
    );
  }
}
