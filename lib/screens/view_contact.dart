import 'dart:math' as math;

import 'package:flutter/material.dart';

import 'package:contacts/main.dart';

class View extends StatelessWidget {
  final Contact contact;
  final int index;
  const View({
    Key? key,
    required this.contact,
    required this.index,
  }) : super(key: key);

  String get data => 'Call';

  IconData? get icon => Icons.call;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Hero(
          tag: index,
          child: Material(
            color: Colors.transparent,
            child: ListView(
              children: [
                SizedBox(
                  height: 35,
                ),
                Center(
                  child: Stack(
                    children: [
                      CircleAvatar(
                        radius: 60,
                        backgroundImage: NetworkImage(contact.image),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 12,
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white, shape: BoxShape.circle),
                          child: RotationTransition(
                            turns: AlwaysStoppedAnimation(55 / 360),
                            child: (contact.isIncome)
                                ? Icon(
                                    Icons.arrow_upward_outlined,
                                    color: Colors.green,
                                  )
                                : Icon(
                                    Icons.arrow_downward_outlined,
                                    color: Colors.red,
                                  ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 36,
                ),
                Material(
                  color: Colors.transparent,
                  child: Column(
                    children: [
                      Text(
                        contact.name,
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Text(contact.number),
                    ],
                  ),
                ),
                SizedBox(
                  height: 36,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ButtonCol(icon: icon, data: data),
                    ButtonCol(icon: Icons.message, data: 'Message'),
                    ButtonCol(icon: Icons.video_call, data: 'Video'),
                  ],
                ),
                SizedBox(
                  height: 36,
                ),
                Divider(),
                ListTile(
                  title: Text(DateTime.now().toIso8601String()),
                ),
                Divider(),
                ListTile(
                  title: Text(DateTime.now().toIso8601String()),
                ),
                Divider(),
                ListTile(
                  title: Text(DateTime.now().toIso8601String()),
                ),
                Divider(),
                ListTile(
                  title: Text(DateTime.now().toIso8601String()),
                ),
                Divider(),
                ListTile(
                  title: Text(DateTime.now().toIso8601String()),
                ),
                Divider(),
                ListTile(
                  title: Text(DateTime.now().toIso8601String()),
                ),
              ],
            ),
          ),
        ));
  }
}

class ButtonCol extends StatelessWidget {
  const ButtonCol({
    Key? key,
    required this.icon,
    required this.data,
  }) : super(key: key);

  final IconData? icon;
  final String data;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
        ),
        Text(data)
      ],
    );
  }
}
