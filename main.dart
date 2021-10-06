import 'package:flutter/material.dart';
import 'home_page.dart';
import 'search_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        iconTheme: IconThemeData(color: Color.fromARGB(40,40, 40, 1)),
        appBarTheme: AppBarTheme(elevation: 1,
        color: Colors.white,
         iconTheme: IconThemeData(color: Color.fromARGB(40, 40, 40, 1))), 
        primarySwatch: Colors.pink,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int currentPage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: currentPage == 1 ? SearchPage() : HomePage(),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          children: [
            IconButton(
              icon: Icon(
                Icons.home,
                color: currentPage == 0
                    ? Color.fromARGB(203, 73, 101, 1)
                    : Color.fromARGB(40, 40, 40, 1),
              ),
              onPressed: () {
                setState(() {
                  currentPage = 0;
                });
              },
            ),
            Spacer(),
            IconButton(
              icon: Icon(
                Icons.search,
                color: currentPage == 1
                    ? Color.fromARGB(203, 73, 101, 1)
                    : Color.fromARGB(40, 40, 40, 1),
              ),
              onPressed: () {
                setState(() {
                  currentPage = 1;
                });
              },
            ),
            Spacer(),
            IconButton(
              icon: Icon(
                Icons.ondemand_video,
                color: currentPage == 2
                    ? Color.fromARGB(203, 73, 101, 1)
                    : Color.fromARGB(40, 40, 40, 1),
              ),
              onPressed: () {
                setState(() {
                  currentPage = 2;
                });
              },
            ),
            Spacer(),
            IconButton(
              icon: Icon(
                Icons.card_travel,
                color: currentPage == 3
                    ? Color.fromARGB(203, 73, 101, 1)
                    : Color.fromARGB(40, 40, 40, 1),
              ),
              onPressed: () {
                setState(() {
                  currentPage = 3;
                });
              },
            ),
            Spacer(),
            IconButton(
              icon: Icon(
                Icons.person,
                color: currentPage == 4
                    ? Color.fromARGB(203, 73, 101, 1)
                    : Color.fromARGB(40, 40, 40, 1),
              ),
              onPressed: () {
                setState(() {
                  currentPage = 4;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
