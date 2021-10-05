import 'package:flutter/material.dart';


void main() {
  runApp(const MyApp());
}

class ig {
  var image;
  String likes;


  ig( this.image,  this.likes);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Catsgram',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(title: 'Catsgram'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  int _selectedIndex = 0;
  static late List<Widget> _pages;

    _MyHomePageState() {
      _pages =[

        buildIGList(),

        Text(
          'Comming Soon...',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 15
          ),
        ),

      ];
    }





  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  var igs = [
    ig('https://i.pinimg.com/564x/ed/6f/dd/ed6fdd81858397d149ed2bddd2db9d83.jpg','324 likes' ),
    ig('https://i.pinimg.com/originals/5c/a3/2e/5ca32e3e3b3901f7236b11e3336166d9.jpg','3024 likes' ),
    ig('https://i.pinimg.com/564x/4b/41/b9/4b41b97b9830acf6a001f99797add6be.jpg','1000 likes' ),
    ig('https://i.pinimg.com/564x/82/d6/86/82d686c6b0cecd9526d2c8895324e895.jpg','10K likes' ),
    ig('https://i.pinimg.com/236x/1e/fa/b7/1efab70e14d7210f223ba704f7a077d3.jpg','253 likes' ),
    ig('https://i.pinimg.com/564x/b6/2a/6c/b62a6cd76abc74602ef54c1697c740f1.jpg','4353 likes' ),
    ig('https://i.pinimg.com/236x/c6/19/16/c619160bcc76e830c4f839da4cb11f99.jpg','22K likes' ),
    ig('https://i.pinimg.com/originals/49/3b/ff/493bff8ea65d165a45723597ea553b21.jpg','100K likes' ),
    ig('https://i.pinimg.com/originals/dd/c2/1f/ddc21f8c278a27abd4be7a0c48f72a26.gif','50 likes' ),
    ig('https://i.pinimg.com/236x/34/fc/76/34fc76ce64dbaf7544a3946330822363.jpg','2023 likes' ),
    ig('https://i.pinimg.com/564x/78/e2/72/78e2727a38ff24e13f21d53bb8bc1294.jpg','993 likes' ),
    ig('https://i.pinimg.com/564x/a3/89/f5/a389f597020f361f7f6d9b79323598fc.jpg','1963 likes' ),
    ig('https://i.pinimg.com/564x/0a/4b/c6/0a4bc6448ad15398ccddb1abffea5fbd.jpg','49M likes' ),
  ];


  Widget buildIGCard(ig _ig) {

    return Container(
      // color: Color(0xff162f5a),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.white, width: 5)
      ),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.network(
              _ig.image,
              height: 300,
              width: double.maxFinite,
              fit: BoxFit.cover,
            ),
            Row(

              children: [

                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Icon(
                    Icons.favorite_outline,
                    color: Colors.white,
                    size: 45,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Icon(
                    Icons.location_on_outlined,
                    color: Colors.white,
                    size: 45,
                  ),
                ),
                Expanded(
                  child: Container(),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Icon(
                    Icons.more_vert,
                    color: Colors.white,
                    size: 45,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(_ig.likes, style: TextStyle(
                  color: Colors.white, fontSize: 30,
                  fontWeight: FontWeight.w800,

              ),),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildIGList() {
    return ListView.builder(
      itemBuilder: (_context, index) {
        return buildIGCard(igs[index]);
      },
      itemCount: igs.length,
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.grey[900],

      body: Center(
        child: _pages.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: new BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: Colors.grey
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'favorite',
          ),

        ],
        currentIndex: _selectedIndex,
        backgroundColor: Colors.white,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}


