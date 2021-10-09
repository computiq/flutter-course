import 'package:contacts_01/ui/new_note_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'data.dart';
import 'models/contact.dart';
import 'models/note.dart';

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

  Future<int> getSavedCounter() async {
    var prefs = await SharedPreferences.getInstance();
    // prefs.set
    // counter = prefs.getInt('counter_key') ?? 0;
    debugPrint('counter is set...');
    counter = prefs.getInt('counter_key') ?? 0;

    return counter;
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

  Widget noteItemView(NoteModel note) {
    return Card(
      child: InkWell(
        onTap: () {
          openNewNote(noteModel: note);
        },
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  note.content,
                  maxLines: 1,
                  softWrap: true,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Expanded(
                child: Container(),
              ),
              IconButton(
                icon: Icon(Icons.remove_circle_outline),
                onPressed: () => removeNote(note),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildNotesList() {
    return ListView.builder(
      itemBuilder: (_context, index) => noteItemView(notes[index]),
      itemCount: notes.length,
    );
  }

  void insertNewNote() {
    notes.add(NoteModel('New note ${notes.length}'));
    setState(() {});
  }

  void openNewNote({NoteModel? noteModel}) {
    NoteModel _note = noteModel ?? NoteModel('going to shop');
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => NewNotePage(_note)),
    ).then((value) {
      if (noteModel == null) {
        notes.add(_note);
      }
      setState(() {});
    });
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

    var futureWidget = FutureBuilder<int>(
      future: getSavedCounter(), // async work
      builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
        debugPrint('snapshot: ${snapshot.connectionState}');

        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return Container(
              width: 100,
              height: 100,
              color: Colors.red,
            );
          default:
            if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              return Text(
                'Counter: ${snapshot.data}',
                style: TextStyle(fontSize: 40),
              );
            }
        }
      },
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(child: futureWidget),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        child: const Icon(Icons.add),
      ),
    );
  }
}
