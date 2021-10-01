import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
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

    return Scaffold(

      backgroundColor: Color(0xff162f5a),
      body: SafeArea(child: buildIGCard()),
    );
  }
}
