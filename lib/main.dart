import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

void main() {
  runApp(const MyApp());
}

class contact {
  String image;
  String name;
  String number;
  DateTime date;
  bool IsIncoming;

  contact(this.image, this.name, this.number, this.date, this.IsIncoming);
}

class post {
  String image;
  String likes;
  post(this.image, this.likes);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: const MyHomePage(title: 'my first app'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Widget buildContactItem(contact _contact) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(_contact.image),
            ),
            Padding(
              padding: const EdgeInsets.all(17),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(_contact.name,
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  Text(_contact.number)
                ],
              ),
            ),
            Expanded(
                child: Text(_contact.date.toIso8601String().split('T').first)),
            if (_contact.IsIncoming)
              Icon(
                Icons.arrow_downward,
                color: Colors.red,
              )
            else
              Icon(
                Icons.arrow_upward,
                color: Colors.purple,
              )
          ],
        ),
      ),
    );
  }

  Widget buildIGcard(post _post) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.network("https://i.pravatar.cc/401"),
        Row(
          children: [
            const Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                Icons.favorite_sharp,
                color: Colors.red,
              ),
            ),
            const Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.location_on),
            ),
            Expanded(child: Container()),
            const Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.more_vert),
            )
          ],
        ),
        Text('$post.likes likes')
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    var contacts = [
      contact('https://i.pravatar.cc/310', 'ahmad', '07700014709',
          DateTime.now().add(const Duration(seconds: 3)), true),
      contact('https://i.pravatar.cc/150?u=fake@pravatar.com', 'ali',
          '07700014764', DateTime.now().add(const Duration(seconds: 3)), false),
      contact('https://i.pravatar.cc/305', 'abd', '07700014709',
          DateTime.now().add(const Duration(seconds: 3)), true),
      contact('https://i.pravatar.cc/150?u=a042581f4e29026704d', 'mhmad',
          '07700014709', DateTime.now().add(const Duration(seconds: 3)), false),
      contact('https://i.pravatar.cc/150?u=fake@pravatar.com', 'manhel',
          '07700014709', DateTime.now().add(const Duration(seconds: 3)), true),
      contact('https://i.pravatar.cc/300', 'hussen', '07700014709',
          DateTime.now().add(const Duration(seconds: 3)), false),
      contact('https://i.pravatar.cc/300', 'ahmad', '07700014709',
          DateTime.now().add(const Duration(seconds: 3)), true),
      contact('https://i.pravatar.cc/150?u=fake@pravatar.com', 'ali',
          '07700014764', DateTime.now().add(const Duration(seconds: 3)), false),
      contact('https://i.pravatar.cc/303', 'abd', '07700014709',
          DateTime.now().add(const Duration(seconds: 3)), true),
      contact('https://i.pravatar.cc/151?u=a042581f4e29026704d', 'mhmad',
          '07700014709', DateTime.now().add(const Duration(seconds: 3)), false),
      contact('https://i.pravatar.cc/140?u=fake@pravatar.com', 'manhel',
          '07700014709', DateTime.now().add(const Duration(seconds: 3)), true),
      contact('https://i.pravatar.cc/307', 'hussen', '07700014709',
          DateTime.now().add(const Duration(seconds: 3)), false)
    ];
    var posts = [
      post('https://i.pravatar.cc/407', '24324'),
      post('https://i.pravatar.cc/406', '24324'),
      post('https://i.pravatar.cc/404', '24324'),
      post('https://i.pravatar.cc/405', '24324'),
    ];

    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: ListView.builder(
          itemBuilder: (_context, index) {
            return buildContactItem(contacts[index]);
          },
          itemCount: contacts.length,
        )
        // body: ListView.builder(itemBuilder: (_context, index) {
        // return buildIGcard(post);

        // body: SafeArea(child: buildIGcard()),
        // }),
        );
  }
}
