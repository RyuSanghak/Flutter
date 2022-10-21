import 'package:flutter/material.dart';
import 'package:labco_particlemonitor/SplashScreen.dart';

void main() {
  runApp(const SplashScreen());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: Scaffold(

        appBar:  AppBar(
          title: Text('LABCO'),
          leading: Builder(builder: (context) => IconButton(onPressed: (){ // change drawer icon
            Scaffold.of(context).openDrawer();
          },icon: Icon(Icons.menu)),
          ),
        ),
        drawer: NavDrawer(),
        body: Container(
          height: 150,
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black, width: 10),
            borderRadius: BorderRadius.circular(20)
          ),
          child: Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black12, width: 5),
                  borderRadius: BorderRadius.circular(20),
                ),
                child:
                Image.asset('assets/particleCounter.png', width: 150),
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('파티클 카운터'),
                    Text('100000000'),
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          child: SizedBox(
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget> [
                IconButton(
                  icon: Icon(Icons.phone),
                  onPressed: (){},
                ),
                IconButton(
                    onPressed: (){},
                    icon: Icon(Icons.message)
                ),
                IconButton(
                    onPressed: (){},
                    icon: Icon(Icons.contact_mail)
                ),
              ],
            ),
          ),
        ),
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