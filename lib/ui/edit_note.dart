import 'package:contacts_01/models/db_conn.dart';
import 'package:contacts_01/models/note_model.dart';
import 'package:contacts_01/widget/note_form.dart';
import 'package:flutter/material.dart';

class AddEditNotePage extends StatefulWidget {
  final NoteModel? note;

  const AddEditNotePage({
    Key? key,
    this.note,
  }) : super(key: key);
  @override
  _AddEditNotePageState createState() => _AddEditNotePageState();
}

class _AddEditNotePageState extends State<AddEditNotePage> {
  final _formKey = GlobalKey<FormState>();
  late bool isFinished;
  late int id;
  late String content;
  late DateTime initDate;

  @override
  void initState() {
    super.initState();

    isFinished = widget.note?.isFinished ?? false;
    content = widget.note?.content ?? '';
    id = widget.note?.id ?? 0;
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.blueGrey.shade50,
        appBar: AppBar(
          foregroundColor: Colors.blueAccent,
          backgroundColor: Colors.blueGrey.shade100,
          elevation: 0,
          actions: [widget.note != null?
            IconButton(
              onPressed: () async {
                await NotesDatabase.instance.delete(id);

                Navigator.of(context).pop();
              },
              icon: const Icon(Icons.delete),
            ):Container(),
          ],
        ),
        body: Form(
          key: _formKey,
          child: NoteFormWidget(
            isFinished: isFinished,
            content: content,
            onChangedFinished: (isFinished) =>
                setState(() => this.isFinished = isFinished),
            onChangedcontent: (content) =>
                setState(() => this.content = content),
          ),
        ),
        floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.blueGrey.shade100,
            onPressed: addOrUpdateNote,
            child: const Icon(
              Icons.check,
              color: Colors.blueAccent,
              size: 25,
            )),
      );

  void addOrUpdateNote() async {
    final isValid = _formKey.currentState!.validate();

    if (isValid) {
      final isUpdating = widget.note != null;

      if (isUpdating) {
        await updateNote();
      } else {
        await addNote();
      }

      Navigator.of(context).pop();
    }
  }

  Future updateNote() async {
    final note = widget.note!.copy(
      isFinished: isFinished,
      content: content,
    );

    await NotesDatabase.instance.update(note);
  }

  Future addNote() async {
    final note = NoteModel(
      content: content,
      isFinished: false,
      initDate: DateTime.now(),
    );

    await NotesDatabase.instance.create(note);
  }
}
