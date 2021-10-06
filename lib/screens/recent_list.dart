import 'package:flutter/material.dart';
import 'package:selfishmachine/model/user.dart';

class RecentList extends StatelessWidget {
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
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: users.length,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          leading: CircleAvatar(
            child: Text(users[index].name[0]),
          ),
          trailing: IconButton(
            onPressed: () {},
            icon: Icon(Icons.phone),
            highlightColor: Colors.teal,
          ),
          title: Text(users[index].name),
          subtitle: Text(users[index].phone),
          onTap: () {},
        );
      },
    );
  }
}
