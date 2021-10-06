import 'package:flutter/material.dart';

void main() {
  runApp(const HomePage());
}

class Contact {
  String image;
  String name;
  String mobileNumber;
  DateTime date;
  bool isIncoming;
  Contact(this.image, this.name, this.mobileNumber, this.date, this.isIncoming);
}

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

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("asdasd"),
          centerTitle: true,
        ),
        body: Container(
          child: index == 0
              ? const Text("Home")
              : index == 1
                  ? const ContactListPage()
                  : const Text("School"),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: index,
          onTap: (i) => setState(() {
            index = i;
          }),
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.contact_phone),
              label: 'Contact',
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.access_time_outlined),
                label: 'School',
                activeIcon: Icon(Icons.access_time_filled)),
          ],
        ),
      ),
    );
  }
}

// Widget ContactListPage() {
//   return Card();
// }

class ContactListPage extends StatefulWidget {
  const ContactListPage({Key? key}) : super(key: key);

  @override
  _ContactListPageState createState() => _ContactListPageState();
}

class _ContactListPageState extends State<ContactListPage> {
  @override
  Widget build(BuildContext context) {
    List<Widget> _Conatct = [];
    contacts.forEach((e) => {
          print(e.name),
          _Conatct.add(Contacts(
              name: e.name,
              imgURL: e.image,
              number: e.mobileNumber,
              date: e.date,
              isComing: e.isIncoming))
        });
    return ListView(
      children: _Conatct,
    );
  }
}

Widget Contacts(
    {String name = "",
    String imgURL = "",
    String number = "",
    bool isComing = false,
    DateTime? date}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
      SizedBox(
        height: 75.0,
        child: Card(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image.network(
                      imgURL,
                      width: 50,
                      fit: BoxFit.cover,
                    )),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(number),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30),
                child:
                    Text(date!.toIso8601String().split('T').first.toString()),
              ),
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    isComing
                        ? const Icon(
                            Icons.arrow_upward,
                            color: Colors.green,
                          )
                        : const Icon(
                            Icons.arrow_downward,
                            color: Colors.red,
                          )
                  ],
                ),
              ))
            ],
          ),
        ),
      ),
    ],
  );
}
