import 'package:flutter/material.dart';
import 'contacts_list.dart';
import 'favorites_list.dart';
import 'recent_list.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App 2',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final tabs = [
      const RecentListView(),
      const FavoriteListView(),
      const ContactListView(),
    ];
    int _curentIndex = 0;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contacts'),
      ),
      body: tabs[_curentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _curentIndex,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.access_time_outlined),
              backgroundColor: Colors.green,
              label: 'Recent'),
          BottomNavigationBarItem(
              icon: Icon(Icons.star_outline),
              backgroundColor: Colors.yellow,
              label: 'Favorites'),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              backgroundColor: Colors.orange,
              label: 'Contacts'),
        ],
        type: BottomNavigationBarType.shifting,
        onTap: (index) {
          setState(() => _curentIndex = index);
        },
      ),
    );
  }
}
