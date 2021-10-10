// ignore_for_file: file_names

import 'package:flutter/material.dart';
class BottomNav extends StatelessWidget {
  const BottomNav({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: const Color(0xff0f1626),
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
            icon: Icon(Icons.home_filled,color: Color(0xff474d5a),),
            label: '',
            backgroundColor: Color(0xff292f3b)),
        BottomNavigationBarItem(
          backgroundColor: Color(0xff292f3b),
          icon: Icon(Icons.play_circle_filled_outlined,color: Color(0xff474d5a)),
          label: '',
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart,color: Color(0xff474d5a)),
            label: '',
            backgroundColor: Color(0xff292f3b)),
        BottomNavigationBarItem(
            icon: Icon(Icons.people,color: Color(0xff474d5a)),
            label: '',
            backgroundColor: Color(0xff292f3b)),
        BottomNavigationBarItem(
            icon: Icon(Icons.category_rounded),
            label: '',
            backgroundColor: Color(0xff292f3b)),
      ],
      currentIndex: 4,
      selectedItemColor: Colors.blue,
      onTap: (_) => {},
    );
  }
}
