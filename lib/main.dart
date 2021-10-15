import 'dart:async';
import 'dart:convert';

import 'package:contacts_01/models/error.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tuple/tuple.dart';

import 'models/note.dart';
import 'models/user.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Notes App',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(title: 'Saving/Restoring Counter'),
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
  var notes = [];

  int counter = 0;

  List<User> favoriteUsers = [];

  StreamController<int> streamController = StreamController();

  String usersKey = 'usersKey5';

  Future<int> getSavedCounter() async {
    var prefs = await SharedPreferences.getInstance();
    // prefs.set
    // counter = prefs.getInt('counter_key') ?? 0;
    debugPrint('counter is set...');
    counter = prefs.getInt('counter_key') ?? 0;

    return counter;
  }

  Future<Tuple2<ErrorResponse?, List<User>?>> fetchUsers() async {
    // var savedUsers = await getSavedUsers();
    var savedUsers = null;

    var response;
    if (savedUsers == null) {
      try {
        var url = Uri.parse('https://jsonplaceholder.typicode.com/users');
        debugPrint('url: ${url}');
        response = await http.get(
          url,
        );
        debugPrint('response: ${response}');
        debugPrint('response.statusCode: ${response.statusCode}');
        var jsonUsers = jsonDecode(response.body);
        // jsonUsers[0]['name'] = null;
        List<User> users = jsonUsers.map<User>((_userJson) => User.fromJson(_userJson)).toList();

        debugPrint('users.length: ${users.length}');

        savedUsers = users;
        saveUsers(users);
      } catch (e) {
        if (response?.statusCode == 200) {
          return Tuple2(ErrorResponse('توجد مشكلة حالياً. يرجى المحاولة فيما بعد', response?.statusCode ?? -1), null);
        }
        return Tuple2(ErrorResponse('يرجى التأكد من إتصالك بالإنترنت', -1), null);
        debugPrint('e: $e');
      }
    }

    return Tuple2(null, savedUsers);
  }

  void saveUsers(List<User> users) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var usersString = jsonEncode(users);
    debugPrint('usersString: $usersString');
    prefs.setString(usersKey, usersString);
  }

  Future<List<User>?> getSavedUsers() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getString(usersKey) == null) {
      return null;
    }
    List usersJson = jsonDecode(prefs.getString(usersKey) ?? '[]');
    return usersJson.map<User>((_userJson) => User.fromJson(_userJson)).toList();
  }

  Widget buildUserView(User user) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(user.name),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(user.phone),
              ),
            ),
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                favoriteUsers.add(user);
                streamController.add(favoriteUsers.length);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget buildUsersList(List<User> users) {
    return ListView.builder(
      itemBuilder: (_context, index) => buildUserView(
        users[index],
      ),
      itemCount: users.length,
    );
  }

  @override
  void initState() {
    debugPrint('initState...');
    getSavedCounter();
    debugPrint('getSavedCounter called...');

    super.initState();
  }

  void removeNote(NoteModel note) {
    notes.remove(note);
    setState(() {});
  }

  _incrementCounter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // counter = (prefs.getInt('counter_key') ?? 0) + 1;
    debugPrint('Pressed $counter times.');
    counter += 1;
    await prefs.setInt('counter_key', counter);
    debugPrint('counter: $counter');

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('build...');

    var futureWidget = FutureBuilder<Tuple2<ErrorResponse?, List<User>?>>(
      future: fetchUsers(),
      builder: (BuildContext context, AsyncSnapshot<Tuple2<ErrorResponse?, List<User>?>> snapshot) {
        debugPrint('snapshot: ${snapshot.connectionState}');

        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return const Center(child: CircularProgressIndicator());
          default:
            var response = snapshot.data;
            if (response?.item1 == null) {
              return buildUsersList(response?.item2 ?? []);
            } else
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('${response?.item1?.message}'),
                  ElevatedButton(
                      onPressed: () {
                        setState(() {});
                      },
                      child: Text('Retry'))
                ],
              );
          // if (snapshot.hasError) {
          //   // return Text('Error: ${snapshot.error}');
          //   return Text(
          //     'يرجى الإتصال بالإنترنت',
          //     style: TextStyle(fontSize: 30),
          //   );
          // } else {
          //   return buildUsersList(snapshot.data ?? []);
          // }
        }
      },
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          StreamBuilder(
            stream: streamController.stream,
            initialData: favoriteUsers.length,
            builder: (_context, snapshot) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('${snapshot.data}', style: TextStyle(fontSize: 20),),
              );
            },
          ),
        ],
      ),
      body: Center(child: futureWidget),
    );
  }
}
