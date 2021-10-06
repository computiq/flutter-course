import 'package:flutter/material.dart';
import 'package:task_contacts/allContacts.dart';
import 'package:task_contacts/deetails.dart';
import 'contact.dart';

void main() => runApp(const MyApp());

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
var url =
    'data:image/png;base64,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';

class _MyHomePageState extends State<MyHomePage> {
   var contacts = [
    Contact(
      url,
      'Ahmed',
      '071766137347',
      DateTime.now().add(
        const Duration(seconds: 3),
      ),
      true,
    ),
    Contact(
      url,
      'Ali',
      '071766137347',
      DateTime.now().add(
        const Duration(days: 1),
      ),
      false,
    ),
    Contact(
      url,
      'Kamal',
      '071766137347',
      DateTime.now().add(
        const Duration(days: 3),
      ),
      true,
    ),
    Contact(
      url,
      'Mohammad',
      '071766137347',
      DateTime.now().add(
        const Duration(days: 5),
      ),
      true,
    ),
    Contact(
      url,
      'Mohammad',
      '071766137347',
      DateTime.now().add(
        const Duration(days: 5),
      ),
      false,
    ),
    Contact(
      url,
      'Hussein',
      '071766137347',
      DateTime.now().add(
        const Duration(days: 6),
      ),
      false,
    ),
    Contact(
      url,
      'Abood',
      '071766137347',
      DateTime.now().add(
        const Duration(days: 7),
      ),
      false,
    ),
    Contact(
      url,
      'Osama',
      '071766137347',
      DateTime.now().add(
        const Duration(days: 6),
      ),
      false,
    ),
  ];

  int _selectedIndex = 0;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  late List<Widget> _pages;

  _MyHomePageState() {
    _pages = [
      buildListView(contacts),

      // Text('hello'),
     const AllContacts()
    ];
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  Widget buildContactItem(Contact _contact) {
    return Card(
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (_) => Details(
                    date: _contact.date,
                    contact_name: _contact.name,
                    number: _contact.mobileNumber,
                    isCom: _contact.isIncoming,
                    image: _contact.image,
                  )));
        },
        onLongPress: () {
          setState(() {
            final AlertDialog alert = AlertDialog(
              title: const Text("Are you sure?"),
              content: SizedBox(
                  height: 80,
                  child: Column(
                    children: [
                      const Divider(color: Colors.red),
                      const Text(
                          "Are you sure you want to delete this contact?"),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          ElevatedButton.icon(
                            icon: const Icon(Icons.cancel),
                            label: const Text(
                              "Cancel",
                              style: TextStyle(color: Colors.white),
                            ),
                            onPressed: () {
                              setState(() {
                                Navigator.pop(context);
                              });
                            },
                          ),
                          Expanded(
                            child: Container(),
                          ),
                          ElevatedButton.icon(
                            style:  ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.red),),
                            icon: const Icon(Icons.delete),
                            label: const Text(
                              "Delete",
                              style: TextStyle(color: Colors.white),
                            ),
                            onPressed: () {
                              setState(() {
                                Navigator.pop(context);
                              });
                            },
                          ),
                        ],
                      ),
                    ],
                  )),
            );
            showDialog(context: context, builder: (_) => alert);
          });
        },
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
                const Icon(
                  Icons.south_west,
                  color: Colors.red,
                )
              else
                const Icon(
                  Icons.north_east,
                  color: Colors.green,
                )
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {



    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body:Container(child:_pages[_selectedIndex]),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.access_time),
            label: 'Recent',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.contact_page_rounded),
            label: 'All Contacts',
          ),

        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }

  ListView buildListView(List<Contact> contacts) {
    return ListView.builder(
      itemBuilder: (_context, index) {
        return buildContactItem(contacts[index]);
      },
      itemCount: contacts.length,
    );
  }
}
