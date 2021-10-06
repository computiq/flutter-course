import 'package:flutter/material.dart';
import 'package:selfishmachine/model/example_list.dart';
import 'package:selfishmachine/screens/my_bottom_nav.dart';

void main() => runApp(MyApp());
ThemeData myTheme = ThemeData(
    primarySwatch: Colors.teal,
    buttonColor: Colors.teal,
    buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.primary));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: myTheme,
      debugShowCheckedModeBanner: false,
      routes: <String, WidgetBuilder>{
        "/": (BuildContext context) => MyHomePage(),
        "/MyBottomeNav": (BuildContext context) => MyBottomeNav()
      },
    );
  }
}

final List<ExampleList> _exampleList = <ExampleList>[
  ExampleList(
    title: 'Simple Dialog',
    subTitle: 'hi so whyjshak',
  ),
  ExampleList(
    title: 'costom floating button',
    subTitle: 'A custom fskaf;lasflknfn',
  ),
  ExampleList(title: 'bottom nav', subTitle: 'sajnfojsanfonsaofnbo'),
  ExampleList(title: 'more design', subTitle: 'sajndfjsabnfjlkbsa'),
];

class MyHomePage extends StatelessWidget {
  void _navigateToPage(BuildContext context, int index) {
    switch (index) {
      case 0:
        Navigator.of(context).pushNamed("/MySimpleDialog");
        break;
      case 1:
        print("coustom floating button");
        break;
      case 2:
        Navigator.of(context).pushNamed("/MyBottomeNav");
        break;
      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('selfish machine'),
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(5),
        itemCount: _exampleList.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            contentPadding: EdgeInsets.all(5),
            leading: CircleAvatar(
              child: Text(_exampleList[index].title[0]),
            ),
            title: Text(_exampleList[index].title),
            subtitle: Text(_exampleList[index].subTitle),
            onTap: () => _navigateToPage(context, index),
          );
        },
      ),
    );
  }
}
