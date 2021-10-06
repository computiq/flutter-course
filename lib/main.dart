import 'package:flutter/material.dart';


class Contacts {
  String name, phoneNumber, image;
  DateTime date;
  bool isIncoming;
  Contacts(this.name, this.phoneNumber, this.image, this.date, this.isIncoming);
}

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  // ignore: non_constant_identifier_names
  static late List<Widget> _Pages;
  _HomepageState() {
    _Pages = <Widget>[
      buildCntactsList(),
      const Text(
        'Index 1: Business',
        style: optionStyle,
      ),
      const Text(
        'Index 2: School',
        style: optionStyle,
      ),
      const Text(
        'Index 3: Settings',
        style: optionStyle,
      ),
    ];
  }
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget buildCntactsList() {
    var contacts = [
      Contacts("Manhal", "047894184154", "https://i.pravatar.cc/300",
          DateTime.now().add(const Duration(days: 3)), true),
      Contacts("ali", "045959418415", "https://i.pravatar.cc/301",
          DateTime.now().add(const Duration(days: 4)), false),
      Contacts("mohamed", "045959424788", "https://i.pravatar.cc/302",
          DateTime.now().add(const Duration(days: 5)), true),
      Contacts("mustafa", "045914584788", "https://i.pravatar.cc/303",
          DateTime.now().add(const Duration(days: 5)), false),
      Contacts("jaafer", "045975864788", "https://i.pravatar.cc/304",
          DateTime.now().add(const Duration(days: 5)), false),
      Contacts("khaled", "045913495788", "https://i.pravatar.cc/305",
          DateTime.now().add(const Duration(days: 5)), true),
      Contacts("karrar", "045913495788", "https://i.pravatar.cc/306",
          DateTime.now().add(const Duration(days: 5)), false),
      Contacts("diyar", "045913495788", "https://i.pravatar.cc/307",
          DateTime.now().add(const Duration(days: 5)), true),
      Contacts("maath", "045913495788", "https://i.pravatar.cc/308",
          DateTime.now().add(const Duration(days: 5)), false),
      Contacts("jasem", "045913495788", "https://i.pravatar.cc/309",
          DateTime.now().add(const Duration(days: 5)), true),
    ];

    return ListView.builder(
      itemCount: contacts.length,
      itemBuilder: (BuildContext context, int index) {
        return buildContactItem(contacts[index]);
      },
    );
  }

  Widget buildContactItem(Contacts _contact) {
    return Card(
        child: Row(
      children: [
        CircleAvatar(
          backgroundImage: NetworkImage(_contact.image),
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                _contact.name,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(_contact.phoneNumber),
            ],
          ),
        ),
        Text(_contact.date.toIso8601String().split("T").first),
        Expanded(child: Container()),
        if (_contact.isIncoming)
          (const Icon(
            Icons.arrow_upward,
            color: Colors.green,
          ))
        else
          (const Icon(Icons.arrow_downward, color: Colors.red))
      ],
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _Pages[_selectedIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: Colors.red,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Business',
            backgroundColor: Colors.green,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'School',
            backgroundColor: Colors.purple,
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false, home: Homepage());
  }
}
