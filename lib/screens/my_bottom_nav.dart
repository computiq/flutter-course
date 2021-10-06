import 'package:flutter/material.dart';
import 'package:selfishmachine/screens/favorite_list.dart';
import 'package:selfishmachine/screens/recent_list.dart';

class MyBottomeNav extends StatefulWidget {
  @override
  State<MyBottomeNav> createState() => _MyBottomeNavState();
}

class _MyBottomeNavState extends State<MyBottomeNav> {
  int _currentIndex = 0;
  _onTamBottomNavItem(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  Widget _myBottomNavBar() {
    return BottomNavigationBar(
      currentIndex: _currentIndex,
      fixedColor: Colors.teal,
      onTap: _onTamBottomNavItem,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.star),
          title: Text("Favorites"),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.access_time),
          title: Text("Recents"),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.contact_phone),
          title: Text("contacts"),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('bottome Nav'),
      ),
      body: BottomNavContents(index: _currentIndex),
      bottomNavigationBar: _myBottomNavBar(),
    );
  }
}

class BottomNavContents extends StatelessWidget {
  BottomNavContents({required this.index});
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: navBarContents(index, context),
      ),
    );
  }

  Widget navBarContents(int index, BuildContext context) {
    switch (index) {
      case 0:
        return FavoriteList();
        break;
      case 1:
        return RecentList();
        break;
      case 2:
        return RecentList();
        break;
      default:
        return Container();
    }
  }
}
