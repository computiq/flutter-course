import 'package:contacts_01/models/db_conn.dart';
import 'package:contacts_01/models/note_model.dart';
import 'package:contacts_01/ui/edit_note.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

Widget noteItemView(NoteModel note, BuildContext context) {
  if (note.isFinished == false) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          side: const BorderSide(color: Colors.blueAccent),
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: InkWell(
          onTap: () async {
            await Navigator.of(context).push(
              MaterialPageRoute(
                  builder: (context) => AddEditNotePage(note: note)),
            );
          },
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Container(
              color: Colors.transparent,
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        note.content,
                        maxLines: 1,
                        softWrap: false,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(fontSize: 20),
                      ),
                      Text(
                        dateSet(note),
                        style: const TextStyle(
                            fontSize: 20, color: Colors.blueAccent),
                      ),
                    ],
                  ),
                  Expanded(
                    child: Container(),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  } else {
    return Container();
  }
}

Widget checkedNoteItem(NoteModel note, BuildContext context) {
  if (note.isFinished == true) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          side: const BorderSide(color: Colors.blueAccent),
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: InkWell(
          onTap: () async {
            await Navigator.of(context).push(
              MaterialPageRoute(
                  builder: (context) => AddEditNotePage(note: note)),
            );
          },
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Container(
              color: Colors.transparent,
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        note.content,
                        maxLines: 1,
                        softWrap: false,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(fontSize: 20),
                      ),
                      Text(
                        dateSet(note),
                        style: const TextStyle(
                            fontSize: 20, color: Colors.blueAccent),
                      ),
                    ],
                  ),
                  Expanded(
                    child: Container(),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  } else {
    return Container();
  }
}

String dateSet(NoteModel note) {
  var date = note.initDate;
  String formattedDate = DateFormat('yyyy-MM-dd H:m').format(date);
  return formattedDate;
}

addNote(NoteModel note) async {
  await NotesDatabase.instance.create(note);
}
