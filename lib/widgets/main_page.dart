import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[800],
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[700],
        title: const Text(
          "Weather App",
          style: TextStyle(
            color: Colors.yellow,
          ),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      // body: FutureBuilder(
      //   future:
      //   builder: (contx, value) {
      //     print(value);
      //     print("value");
      //     return Text('${value.data}');
      //   },
      // ),
    );
  }
}
