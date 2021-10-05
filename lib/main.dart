import 'package:contacts/screens/view_contact.dart';
import 'package:flutter/material.dart';

import 'package:contacts/const/data.dart';
import 'package:contacts/screens/favorite.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        themeMode: ThemeMode.dark,
        theme: ThemeData(),
        darkTheme: ThemeData(
            brightness: Brightness.dark,
            scaffoldBackgroundColor: Color(0xff162f5a),
            bottomNavigationBarTheme: BottomNavigationBarThemeData(
                backgroundColor: Color(0xff162f5a)),
            appBarTheme: AppBarTheme(backgroundColor: Color(0xff162f5a))
            /* dark theme settings */
            ),
        debugShowCheckedModeBanner: false,
        home: Home());
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int selectedIndex = 0;

  List<Widget> wid = [
    HomeScreen(),
    Favorite(),
  ];
  List<String> names = ['Home', 'Favorite'];
  @override
  Widget build(BuildContext context) {
    // List<Contact> list = [
    // Contact(
    //     image:
    //         'https://www.pixsy.com/wp-content/uploads/2021/04/ben-sweet-2LowviVHZ-E-unsplash-1.jpeg',
    //     name: 'Noaman Monther',
    //     number: '0780xxxxxxx',
    //     date: '2021/10/1',
    //     isIncome: true),
    // ];

    // List<Contact> list = List.generate(12,());
    return Scaffold(
      appBar: AppBar(
        title: Text(names[selectedIndex]),
      ),
      body: wid[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        // selectedItemColor: Colors.red,
        // unselectedItemColor: Colors.green,
        // backgroundColor: Colors.green,
        currentIndex: selectedIndex,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            label: 'Home',
            icon: Icon(Icons.school_rounded),
          ),
          BottomNavigationBarItem(
            label: 'Favorite',
            icon: Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    Key? key,
    // required this.list,
  }) : super(key: key);

  // final List<Contact> list;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (BuildContext context, int index) {
        return UserCard(
          contact: list[index],
          index: index,
        );
        // return Padding(
        //   padding: const EdgeInsets.all(8.0),
        //   child: Container(
        //     height: 400,
        //     decoration: BoxDecoration(
        //         borderRadius: BorderRadius.circular(16),
        //         border: Border.all(color: Colors.white, width: 2)),
        //     // color: Colors.green,
        //     child: Column(
        //       children: [
        //         ClipRRect(
        //           borderRadius: BorderRadius.only(
        //               topLeft: Radius.circular(16),
        //               topRight: Radius.circular(16)),
        //           child: Image(
        //             image: NetworkImage(
        //                 'https://www.pixsy.com/wp-content/uploads/2021/04/ben-sweet-2LowviVHZ-E-unsplash-1.jpeg'),
        //             height: 320,
        //             fit: BoxFit.cover,
        //           ),
        //         ),
        //         Padding(
        //           padding: const EdgeInsets.all(8.0),
        //           child: Column(
        //             crossAxisAlignment: CrossAxisAlignment.start,
        //             children: [
        //               Row(
        //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //                 children: [
        //                   Icon(Icons.favorite_outline),
        //                   SizedBox(
        //                     width: 16,
        //                   ),
        //                   Icon(Icons.location_on_outlined),
        //                   Expanded(
        //                     child: SizedBox(
        //                       width: 16,
        //                     ),
        //                   ),
        //                   Icon(Icons.favorite_outline),
        //                 ],
        //               ),
        //               SizedBox(
        //                 height: 16,
        //               ),
        //               Text('35\t\t\t\t Likes')
        //             ],
        //           ),
        //         )
        //       ],
        //     ),
        //   ),
        // );
      },
    );
  }
}

class UserCard extends StatelessWidget {
  const UserCard({
    Key? key,
    required this.index,
    required this.contact,
    // required this.list,
  }) : super(key: key);
  final int index;
  final Contact contact;

  // final List<Contact> list;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return InkWell(
      onTap: () {
        Get.to(() => View(
              contact: contact,
              index: index,
            ));
      },
      child: Hero(
        tag: index,
        child: Material(
          color: Colors.transparent,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
              ),
              width: size.width,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CircleAvatar(
                      radius: 40,
                      backgroundImage: NetworkImage(list[index].image),
                    ),
                    Spacer(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          list[index].name,
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        Text(list[index].number),
                      ],
                    ),
                    Spacer(),
                    Text(list[index].date),
                    Spacer(),
                    RotationTransition(
                      turns: AlwaysStoppedAnimation(55 / 360),
                      child: (list[index].isIncome)
                          ? Icon(
                              Icons.arrow_upward_outlined,
                              color: Colors.green,
                            )
                          : Icon(
                              Icons.arrow_downward_outlined,
                              color: Colors.red,
                            ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class Contact {
  String image;
  String name;
  String number;
  String date;
  bool isIncome;
  Contact({
    required this.image,
    required this.name,
    required this.number,
    required this.date,
    required this.isIncome,
  });
}
