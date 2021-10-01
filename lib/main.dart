import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class Contact {
  String image;
  String name;
  String mobileNumber;
  DateTime date;
  bool isIncoming;

  Contact(this.image, this.name, this.mobileNumber, this.date, this.isIncoming);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo 2',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(title: 'Contacts App'),
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
  Widget buildContactItem(Contact _contact) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(_contact.image),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _contact.name,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(_contact.mobileNumber),
                ],
              ),
            ),
            Text(_contact.date.toIso8601String().split('T').first),
            Expanded(
              child: Container(),
            ),
            if (_contact.isIncoming)
              Icon(
                Icons.arrow_downward,
                color: Colors.red,
              )
            else
              Icon(
                Icons.arrow_upward,
                color: Colors.green,
              )
          ],
        ),
      ),
    );
  }

  Widget buildIGCard() {
    var imageUrl = 'https://images.pexels.com/photos/1544947/pexels-photo-1544947.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500';

    return Container(
      // color: Color(0xff162f5a),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.white, width: 6),
        color:  Color(0xff162f5a)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.network(
            imageUrl,
            height: 300,
            width: double.maxFinite,
            fit: BoxFit.cover,
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: Icon(
                  Icons.favorite_outline,
                  color: Colors.white,
                  size: 45,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Icon(
                  Icons.location_on_outlined,
                  color: Colors.white,
                  size: 45,
                ),
              ),
              Expanded(
                child: Container(),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Icon(
                  Icons.more_vert,
                  color: Colors.white,
                  size: 45,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('25 Likes', style: TextStyle(
              color: Colors.white, fontSize: 30,
              fontWeight: FontWeight.w800
            ),),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var contacts = [
      Contact(
        'https://i.pravatar.cc/300',
        'Ahmed',
        '71766137347',
        DateTime.now().add(
          const Duration(seconds: 3),
        ),
        true,
      ),
      Contact(
        'https://i.pravatar.cc/301',
        'Ali',
        '71766137347',
        DateTime.now().add(
          const Duration(days: 1),
        ),
        false,
      ),
      Contact(
        'https://i.pravatar.cc/302',
        'Kamal',
        '71766137347',
        DateTime.now().add(
          const Duration(days: 3),
        ),
        true,
      ),
      Contact(
        'https://i.pravatar.cc/303',
        'Mohammad',
        '71766137347',
        DateTime.now().add(
          const Duration(days: 5),
        ),
        true,
      ),
      Contact(
        'https://i.pravatar.cc/304',
        'Mohammad',
        '71766137347',
        DateTime.now().add(
          const Duration(days: 5),
        ),
        false,
      ),
      Contact(
        'https://i.pravatar.cc/305',
        'Hussein',
        '71766137347',
        DateTime.now().add(
          const Duration(days: 6),
        ),
        false,
      ),
      Contact(
        'https://i.pravatar.cc/306',
        'Aboud',
        '71766137347',
        DateTime.now().add(
          const Duration(days: 7),
        ),
        false,
      ),
      Contact(
        'https://i.pravatar.cc/307',
        'Osama',
        '71766137347',
        DateTime.now().add(
          const Duration(days: 6),
        ),
        false,
      ),
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
      ),
    );
  }
}
