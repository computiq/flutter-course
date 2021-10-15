import 'package:contacts_01/models/note.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

Widget noteItemView(NoteModel note) {
  return Card(
    child: InkWell(
      onTap: () {
        // openNewNote(noteModel: note);
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
            // IconButton(
            //   icon: Icon(Icons.remove_circle_outline),
            //   onPressed: () => removeNote(note),
            // ),
          ],
        ),
      ),
    ),
  );
}