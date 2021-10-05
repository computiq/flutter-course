import 'package:contacts_01/constant/aboutme.dart';
import 'package:contacts_01/constant/team_list.dart';
import 'package:flutter/material.dart';


class Teams extends StatefulWidget {
  const Teams({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _TeamsState createState() => _TeamsState();
}

class _TeamsState extends State<Teams> {
  int _currentIndex = 0;
  static late List<Widget> _teamList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          widget.title,
          style: const TextStyle(
              color: Colors.black87, fontSize: 30, fontWeight: FontWeight.w900),
        ),
        centerTitle: false,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Center(
        child: _teamList[_currentIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        iconSize: 40,
        selectedFontSize: 0,
        unselectedFontSize: 0,
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        selectedItemColor: Colors.black87,
        onTap: _onNavTap,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outlined),
            activeIcon: Icon(Icons.person),
            label: '',
          ),
        ],
      ),
    );
  }

  _TeamsState() {
    _teamList = [
      buildTeamList(),
      buildAboutMe(),
    ];
  }
  void _onNavTap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
