import 'package:flutter/material.dart';

import 'TopCard.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      //backgroundColor: Colors.red,
      appBar: AppBar(
        backgroundColor: Color(0x00000000),
        elevation: 0,
        title: Text("Title"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.sort_rounded,
              size: 40,
            ),
          ),
          Expanded(child: Container()),
          CircleAvatar(
            backgroundColor: Colors.white,
            backgroundImage: AssetImage('images/avatar.png'),
          )
        ],
      ),
      body: BuildTopCard(context),
    );
  }
}
