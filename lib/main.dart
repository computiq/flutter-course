import 'package:flutter/material.dart';
import 'home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Notes App',
      theme: ThemeData(fontFamily: 'Tajawal'),
      debugShowCheckedModeBanner: false,
      home: const NotesPage(title: 'Notes App'),
    );
  }
}
