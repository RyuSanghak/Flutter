import 'package:flutter/material.dart';
import 'package:labco_particlemonitor/Search_screen.dart';
import 'package:labco_particlemonitor/SplashScreen.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'blue_device.dart';
void main() {
  runApp(const SplashScreen());
}

class MainPage extends StatefulWidget {
  MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() =>_MainPageState();
}

class _MainPageState extends State<MainPage>{
  List pages = [
    HomePage(),
    SearchScreen(),
    BluetoothConnectPage(),
    SearchScreen()
  ];
  int currentIndex = 0;
  void onTap(int index){
    setState((){
      currentIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return
         Scaffold(
            body: pages[currentIndex],
            bottomNavigationBar: Theme(
            data: ThemeData(
              backgroundColor: Colors.transparent,
              splashFactory: NoSplash.splashFactory,
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              hoverColor: Colors.transparent,
            ),
            child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              //type: BottomNavigationBarType.shifting,
              onTap: onTap,
              currentIndex: currentIndex,
              selectedItemColor: Colors.blueAccent,
              unselectedItemColor: Colors.grey,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              elevation: 0,
              items: const [
                BottomNavigationBarItem(
                  label: 'home',
                    tooltip: 'home', icon: Icon(Icons.apps)),
                BottomNavigationBarItem(
                  label: 'search',
                    tooltip: 'search', icon: Icon(Icons.search)),
                BottomNavigationBarItem(
                  label: 'person',
                    tooltip: 'Bluetooth',icon: Icon(Icons.bluetooth)),
                BottomNavigationBarItem(
                    label: 'something',tooltip: 'something',icon: Icon(Icons.search)),
              ],
            )
         )
         );
  }
}



class NavDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          //topRight: Radius.circular(50),
          bottomRight: Radius.circular(50),
        ),
      ),
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text(
              'Side menu',
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
            decoration: BoxDecoration(
                color: Colors.blue,
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage('assets/images/cover.jpg'))),
          ),
          ListTile(
            leading: Icon(Icons.input),
            title: Text('Welcome'),
            onTap: () => {},
          ),
          ListTile(
            leading: Icon(Icons.verified_user),
            title: Text('Profile'),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: Icon(Icons.border_color),
            title: Text('Feedback'),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Logout'),
            onTap: () => {Navigator.of(context).pop()},
          ),
        ],
      ),
    );
  }
}
