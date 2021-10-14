// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './bottomNav.dart';
import './imageContainer.dart';
import './lastPadding.dart';
import './menuRow.dart';
import './topContainer.dart';




void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: const Color.fromRGBO(34, 40, 51, 1),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
  bool isActive = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(

        backgroundColor: const Color(0xff0f1626),
        //
        appBar: buildAppBar(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const TopContainer(),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: Container(
                  height: 510,
                  decoration: const BoxDecoration(
                      color: Color(0xff222833),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(35),
                          topRight: Radius.circular(35))),
                  child: Column(
                    children: const [
                      MenuRow(),
                      //الصور
                      ImageContainer(),
                      //الازرار التحت
                      LastPadding()
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        bottomNavigationBar: const BottomNav(),
      ),
    );
  }



  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: const Color(0xff222833),
      leading: const Padding(
        padding: EdgeInsets.all(8.0),
        child: CircleAvatar(
          backgroundImage: AssetImage('images/facebook.png'),
        ),
      ),
      actions: [
        buildAppBarIcons(Icons.search),
        buildAppBarIcons(Icons.notifications),
        Padding(
          padding: const EdgeInsets.all(14.0),
          child: Image.asset('images/messenger.png'),
        ),
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundImage: AssetImage('images/46.png'),
          ),
        )
        // buildAppBarIcons(Icons.person_pin),
      ],

    );
  }

  Widget buildAppBarIcons(IconData icon) => Padding(
    padding: const EdgeInsets.all(8.0),
    child: Icon(
      icon,
      size: 25,
    ),
  );
}
