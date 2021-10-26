// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import 'text_box.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String country, city;
  const MyAppBar({Key? key, required this.country, required this.city})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 1,
      title: TextBox(),
      actions: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Text(
                  '$country, $city',
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: 8.0,
                )
              ],
            ),
          ],
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
