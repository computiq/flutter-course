// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'new_note_page.dart';
//
// void main() => runApp(NoteApp());
//
// class NoteApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Notes App',
//       theme: ThemeData(
//         primarySwatch: Colors.purple,
//       ),
//       home: MyHomePage(title: 'Note App'),
//     );
//   }
// }
//
// class MyHomePage extends StatefulWidget {
//   MyHomePage({Key? key, required this.title}) : super(key: key);
//
//   final String title;
//
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   List<NoteModel> notes = [];
//
//   Future getData({String? get}) async {
//     final prefs = await SharedPreferences.getInstance();
//     setState(() {
//       var notesList = prefs.getStringList('noteContent');
//       if (notesList != null)
//         for (int i = 0; i < notesList.length; i++) {
//           if (get == 'get')
//             notes.add(NoteModel(notesList[i]));
//           else {
//             notes.removeWhere((element) => element == NoteModel(notesList[i]));
//           }
//         }
//     });
//   }
//
//   @override
//   void initState() {
//     super.initState();
//     getData(get: 'get');
//   }
//
//   void removeNote(NoteModel note) {
//     setState(() {
//       notes.remove(note);
//       getData();
//       setData();
//     });
//   }
//
//   void openNewNote({NoteModel? noteModel}) {
//     NoteModel _note = noteModel ?? NoteModel('');
//     Navigator.of(context)
//         .push(MaterialPageRoute(builder: (context) => NewNotePage(_note)))
//         .then((_) {
//       setState(
//         () {
//           if (noteModel == null) {
//             if (_note.content.isNotEmpty) notes.add(_note);
//           }
//         },
//       );
//       setData();
//     });
//   }
//
//   Future setData() async {
//     final prefs = await SharedPreferences.getInstance();
//     prefs.setStringList('noteContent', notes.map((e) => e.content).toList());
//   }
//
//   Widget noteItemView(NoteModel note) {
//     return Card(
//       child: InkWell(
//         onTap: () {
//           openNewNote(noteModel: note);
//         },
//         child: Padding(
//           padding: const EdgeInsets.all(30.0),
//           child: Row(
//             children: [
//               Expanded(
//                 child: Text(
//                   note.content,
//                   maxLines: 1,
//                   overflow: TextOverflow.ellipsis,
//                   softWrap: true,
//                   style: TextStyle(fontSize: 30.0),
//                 ),
//               ),
//               Expanded(child: Container()),
//               IconButton(
//                   onPressed: () => removeNote(note),
//                   icon: Icon(
//                     Icons.remove_circle_outline,
//                     color: Colors.red,
//                   )),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget buildNotesList() {
//     return ListView.builder(
//       itemBuilder: (_context, index) => noteItemView(notes[index]),
//       itemCount: notes.length,
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: 2,
//       child: Scaffold(
//         appBar: AppBar(
//           title: Text(widget.title),
//         ),
//         body: buildNotesList(),
//         floatingActionButton: FloatingActionButton(
//           onPressed: openNewNote,
//           tooltip: 'Add new note',
//           child: const Icon(Icons.add),
//         ),
//       ),
//     );
//   }
// }
