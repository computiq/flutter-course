//Task 1 and 2:
// import 'package:flutter/material.dart';
// import 'Task_1/instagram_ui.dart';
// import 'Task_2/note_app.dart';

// void main() {
//   runApp(const NoteApp());
// }

//Task 3:
// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './Task_3/Api/weather_api.dart';
import './Task_3/Screens/my_home_page.dart';
import 'Task_3/Api/weather_api.dart';
import 'Task_3/Screens/my_home_page.dart';
// import 'package:provider/provider.dart';
// import 'Provider/my_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: ChangeNotifierProvider(
        create: (BuildContext context) => WetherApi(name: 'Baghdad'),
        child: const MyHomePage(title: 'Weather App'),
        lazy: true,
      ),
    );
  }
}
