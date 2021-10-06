import 'dart:math';

import 'package:flutter/material.dart';
import 'package:selfishmachine/model/user.dart';

class FavoriteList extends StatelessWidget {
  List<User> users = <User>[
    User(name: 'haider sadoonn', phone: "07788099828"),
    User(name: 'tyler jhoseph', phone: "07788099828"),
    User(name: 'donald trump', phone: "07788099828"),
    User(name: 'asap rocky', phone: "07788099828"),
    User(name: 'marlene monso', phone: "07788099828"),
    User(name: 'kanye west', phone: "07788099828"),
    User(name: 'selfishmachine', phone: "07788099828"),
    User(name: 'blurryface', phone: "07788099828"),
    User(name: 'matt maeson', phone: "07788099828"),
    User(name: 'pepopepecheck', phone: "07788099828"),
  ];

  final _random = Random();
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      crossAxisSpacing: 0.5,
      mainAxisSpacing: 0.5,
      childAspectRatio: 1.1,
      children: List<Widget>.generate(
        users.length,
        (index) {
          return GridTile(
            footer: Container(
              padding: const EdgeInsets.all(10),
              child: Text(
                users[index].name,
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      color: Colors.white,
                    ),
              ),
            ),
            child: Card(
              elevation: 0.0,
              color: Colors.primaries[next(0, 17)],
              child: InkWell(
                highlightColor: Colors.primaries[next(0, 17)],
                onTap: () {},
                child: Center(
                  child: Text(
                    users[index].name[0],
                    style: Theme.of(context)
                        .textTheme
                        .headline3!
                        .copyWith(color: Colors.white70),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  int next(int min, int max) => min + _random.nextInt(max - min);
}
