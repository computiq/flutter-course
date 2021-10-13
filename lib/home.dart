import 'package:contacts_01/models/db_conn.dart';
import 'package:contacts_01/models/note.dart';
import 'package:contacts_01/ui/edit_note.dart';
import 'package:flutter/material.dart';
import 'models/note_model.dart';
import 'models/note.dart';

class NotesPage extends StatefulWidget {
  const NotesPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _NotesPageState createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  List<NoteModel> notes = [];
  bool _isloading = false;

  @override
  void initState() {
    refreshNotes();
    super.initState();
  }

  @override
  void dispose() {
    NotesDatabase.instance.close();

    super.dispose();
  }

  Future refreshNotes() async {
    setState(() => _isloading = true);
    notes = await NotesDatabase.instance.readAllNote();
    setState(() => _isloading = false);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.blueGrey.shade50,
        appBar: AppBar(
          backgroundColor: Colors.blueGrey.shade100,
          elevation: 0,
          title: Text(
            widget.title,
            style: const TextStyle(
                color: Colors.black87,
                fontSize: 24,
                fontWeight: FontWeight.w900),
          ),
          bottom: const TabBar(
            labelColor: Colors.blueAccent,
            indicatorColor: Colors.amber,
            tabs: [
              Tab(icon: Icon(Icons.horizontal_split)),
              Tab(icon: Icon(Icons.assignment_turned_in)),
            ],
          ),
        ),
        body: _isloading
            ? const Center(child: CircularProgressIndicator())
            : notes.isEmpty
                ? const Center(
                    child: Text(
                      'No Notes',
                      style: TextStyle(color: Colors.blueAccent, fontSize: 24),
                    ),
                  )
                : TabBarView(
                    children: [noteListBuilder(), checkedNotesBuilder()],
                  ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.blueGrey.shade100,
          onPressed: createNewNote,
          child: const Icon(
            Icons.add,
            color: Colors.blueAccent,
          ),
        ),
      ),
    );
  }

  void createNewNote() async {
    await Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => const AddEditNotePage()),
    );

    refreshNotes();
  }

  noteListBuilder() {
    refreshNotes();
    return ListView.builder(
      itemCount: notes.length,
      itemBuilder: (_context, index) => noteItemView(notes[index], context),
    );
  }

  checkedNotesBuilder() {
    refreshNotes();
    return ListView.builder(
      itemCount: notes.length,
      itemBuilder: (_context, index) => checkedNoteItem(notes[index], context),
    );
  }
}