import 'package:flutter/material.dart';
import 'dart:math' as math;

void main() {
  runApp(const MyApp());
}

class Posts {
  String image;
  String likes;
  Posts(this.image, this.likes);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'bottom Navigation',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(title: 'App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

//////////////////////////

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 2;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static late List<Widget> _pages;

  _MyHomePageState() {
    _pages = [
      buildListView(),
      buildGridView(),
      const Text(
        'Other',
        style: optionStyle,
      ),
    ];
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  var posts = [
    Posts('https://i.pravatar.cc/300', '22'),
    Posts('https://i.pravatar.cc/350', '232'),
    Posts('https://i.pravatar.cc/302', '322'),
    Posts('https://i.pravatar.cc/360', '223'),
    Posts('https://i.pravatar.cc/300', '23'),
    Posts('https://i.pravatar.cc/390', '324'),
    Posts('https://i.pravatar.cc/300', '23'),
    Posts('https://i.pravatar.cc/3340', '324'),
    Posts('https://i.pravatar.cc/3340', '23'),
    Posts('https://i.pravatar.cc/3490', '324'),
  ];

  var grids = [
    Posts('https://i.pravatar.cc/300', '22'),
    Posts('https://i.pravatar.cc/350', '232'),
    Posts('https://i.pravatar.cc/302', '322'),
    Posts('https://i.pravatar.cc/360', '223'),
    Posts('https://i.pravatar.cc/300', '23'),
    Posts('https://i.pravatar.cc/390', '324'),
    Posts('https://i.pravatar.cc/340', '23'),
    Posts('https://i.pravatar.cc/390', '324'),
    Posts('https://i.pravatar.cc/500', '23'),
    Posts('https://i.pravatar.cc/660', '324'),
  ];
//////////////////////////////////////////////////////////listView
  Widget getLists(Posts _contact) {
    return Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        color: Colors.blue[300],
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.all(5.0),
              child: Image.network(_contact.image),
            ),
            Padding(
                padding: EdgeInsets.all(5.0),
                child: Row(children: [
                  const Icon(Icons.favorite_outlined),
                  const Icon(Icons.edit_location_alt_outlined),
                  Expanded(child: Container()),
                  const Icon(Icons.more_vert_outlined),
                ])),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Row(
                children: [const Text('Likes: '), Text(_contact.likes)],
              ),
            ),
          ],
        ));
  }

  Widget buildListView() {
    return ListView.builder(
      itemBuilder: (_context, index) {
        return getLists(posts[index]);
      },
      itemCount: posts.length,
    );
  }

  //////////////////////////////////////////////////////////GridView

  Widget buildGridView() {
    return GridView.builder(
      itemCount: grids.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, crossAxisSpacing: 4.0, mainAxisSpacing: 4.0),
      itemBuilder: (BuildContext context, int index) {
        return CircleAvatar(backgroundImage: NetworkImage(grids[index].image));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: _pages[_selectedIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'ListView',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.grid_3x3),
            label: 'GridView',
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.access_time_outlined),
              label: 'Other',
              activeIcon: Icon(Icons.access_time_filled)),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
