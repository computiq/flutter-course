import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'note_model.dart';
import 'new_note_page.dart';

class NoteApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Notes App',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: MyHomePage(title: 'Notes App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<NoteModel> notes = [];

  //I used getData function to get data from SharedPreferences
  //and I also used it for removing a specific note from notesList
  Future getData({String? get}) async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      var notesList = prefs.getStringList('noteContent');
      if (notesList != null)
        for (int i = 0; i < notesList.length; i++) {
          //here is the check for get data from SharedPreferences
          //if it is false it will execute the else statement which will remove a note
          if (get == 'get')
            notes.add(NoteModel(notesList[i]));
          else {
            notes.removeWhere((element) => element == NoteModel(notesList[i]));
          }
        }
    });
  }

  @override
  void initState() {
    super.initState();
    getData(
        get:
            'get'); //I passed 'get' to the getData so it will know I want to get data not to remove note
  }

  //I used removeNote function to remove a specific note from notesList
  void removeNote(NoteModel note) {
    setState(() {
      notes.remove(note);
      getData(); //I passed nothig to the function so it will know I want to remove data not to get data
      setData(); //I called setData here to save tha data after removing a note
    });
  }

  //I used openNewNote function for editing an existing note and for open and editing a new note
  void openNewNote({NoteModel? noteModel}) {
    NoteModel _note = noteModel ?? NoteModel('');
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => NewNotePage(_note)))
        .then((_) {
      setState(
        () {
          if (noteModel == null) {
            if (_note.content.isNotEmpty) notes.add(_note);
          }
        },
      );
      setData(); //I called setData function to save data after adding and editing a note
    });
  }

  //this function is to set a data and save it
  Future setData() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setStringList('noteContent', notes.map((e) => e.content).toList());
  }

  Widget noteItemView(NoteModel note) {
    return Card(
      child: InkWell(
        onTap: () {
          openNewNote(noteModel: note);
        },
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  note.content,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  softWrap: true,
                  style: TextStyle(fontSize: 30.0),
                ),
              ),
              Expanded(child: Container()),
              IconButton(
                  onPressed: () => removeNote(note),
                  icon: Icon(
                    Icons.remove_circle_outline,
                    color: Colors.red,
                  )),
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

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          bottom: TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.home),
              ),
              Tab(
                icon: Icon(Icons.star),
              ),
            ],
          ),
        ),
        body: TabBarView(children: [
          buildNotesList(),
          Center(
              child: Text(
            'No Favorites Yet',
            style: TextStyle(fontSize: 30.0, color: Colors.grey),
          ))
        ]),
        floatingActionButton: FloatingActionButton(
          onPressed: openNewNote,
          tooltip: 'Add new note',
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
