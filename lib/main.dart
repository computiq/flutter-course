import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'posts.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'instagram',
      home: MyHomePage(),
    );
  }
}

final List postContent = [
  Posts(
      postImage:
          'https://images.pexels.com/photos/1254913/pexels-photo-1254913.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500',
      userImage:
          'data:image/jpeg;base64,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',
      likes: '${130}',
      userName: 'fh_5am'),
  Posts(
      postImage:
          'https://images.pexels.com/photos/1544923/pexels-photo-1544923.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500',
      userImage:
          'https://images.unsplash.com/flagged/photo-1570612861542-284f4c12e75f?ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8cGVyc29ufGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&w=1000&q=80',
      likes: '${304}',
      userName: '11_qr'),
  Posts(
      postImage:
          'https://images.pexels.com/photos/1544947/pexels-photo-1544947.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500',
      userImage:
          'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8cGVyc29ufGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&w=1000&q=80',
      likes: '${212}',
      userName: 'etoi12'),
  Posts(
      postImage:
          'https://images.pexels.com/photos/1544942/pexels-photo-1544942.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500',
      userImage:
          'https://t4.ftcdn.net/jpg/03/83/25/83/360_F_383258331_D8imaEMl8Q3lf7EKU2Pi78Cn0R7KkW9o.jpg',
      likes: '${148}',
      userName: 'nane01'),
];

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  static late List<Widget> _pages;
  _MyHomePageState() {
    _pages = [
      HomeScreen(),
      Center(
        child: Text(
          'No Notifications Yet',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      Center(
        child: Text(
          'Your Profile',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      Center(
        child: Text(
          'No Messages Yet',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
    ];
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('instagram'),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.message_outlined))
        ],
        backgroundColor: Colors.black87,
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black87,
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.white70,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Colors.black87,
            icon: Icon(
              Icons.home_outlined,
            ),
            activeIcon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.black87,
            icon: Icon(
              Icons.favorite_outline,
            ),
            activeIcon: Icon(Icons.favorite),
            label: 'Notifications',
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.black87,
            icon: Icon(
              Icons.person_outline,
            ),
            activeIcon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
