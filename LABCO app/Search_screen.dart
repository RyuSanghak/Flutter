import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _filter = TextEditingController();
  FocusNode focusNode = FocusNode();
  String _searchText = "";

  _SearchScreenState() {
    _filter.addListener(() {
      setState(() {
        _searchText = _filter.text;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(25))),
        title: Text('LABCO', style: TextStyle(color: Colors.blueAccent)),
        leading: Builder(
          builder: (context) => IconButton(
              onPressed: () {
                // change drawer icon
                Scaffold.of(context).openDrawer();
              },
              icon: Icon(Icons.menu)),
        ),
      ),
        body: Column(
          children: <Widget>[
            Padding(
                padding: EdgeInsets.all(1)),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
              ),
              margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
              //color: Colors.black,
              padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      focusNode: focusNode,
                      style: TextStyle(fontSize: 15),
                      autofocus: true,
                      controller: _filter,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white12,
                        prefixIcon:
                        Icon(Icons.search, color: Colors.blueAccent, size: 20),
                        suffixIcon: focusNode.hasFocus
                            ? IconButton(
                          onPressed: () {
                            setState(() {
                              _filter.clear();
                              _searchText = "";
                            });
                          },
                          icon: Icon(Icons.cancel),
                          iconSize: 20,
                        )
                            : SizedBox(),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        )
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(25))),
        title: Text('LABCO', style: TextStyle(color: Colors.blueAccent)),
        leading: Builder(
          builder: (context) => IconButton(
              onPressed: () {
                // change drawer icon
                Scaffold.of(context).openDrawer();
              },
              icon: Icon(Icons.menu)),
        ),
      ),
      body: _buildList()
        
        
        /*Column(
          children: [
            Container(
              height: 50,
            ),
            Container(
              height: 150,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 1),
                  borderRadius: BorderRadius.circular(20)),
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black12, width: 5),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Image.asset('assets/particleCounter.png', width: 150),
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
          ],
        ),
        */

    );
  }
}

Widget _buildList() => ListView(
  padding: EdgeInsets.fromLTRB(10, 20, 20, 10),
  children: [

    particle_tile('MP_10', true),
    Container(height: 10,),
    particle_tile('MP_10', true),
    Container(height: 10,),
    particle_tile('MP_10', true),
    Container(height: 10,),
    particle_tile('MP_10', true),
    Container(height: 10,),
    particle_tile('MP_10', true),
    Container(height: 10,),
    particle_tile('MP_10', true),
    Container(height: 10,),
    particle_tile('MP_10', true),
    Container(height: 10,),
    particle_tile('MP_10', true),
    Container(height: 10,),
    particle_tile('MP_10', true),
    Container(height: 10,),
    particle_tile('MP_10', true),
    Container(height: 10,),
    particle_tile('MP_10', true),
    Container(height: 10,),
    particle_tile('MP_10', true),
    Container(height: 10,),
    particle_tile('MP_10', true),
    Container(height: 10,),
    particle_tile('MP_10', true),
    Container(height: 10,),
    particle_tile('MP_10', true),
    Container(height: 10,),
    particle_tile('MP_10', true),
    Container(height: 10,)

  ],

);

ListTile particle_tile(String DeviceName, bool onAndOff) => ListTile(
  shape: RoundedRectangleBorder(side: BorderSide(color: Colors.black, width: 1),
    borderRadius: BorderRadius.circular(10)
  ),

  title: Text(DeviceName,style: TextStyle(fontSize: 15)),
  subtitle: onAndOff ? Text('Operating...') : Text("Disoperating"),
  leading: ClipRRect(
    borderRadius: BorderRadius.circular(100),
    child: Image.asset('assets/particleCounter.png'),
  ),
);
