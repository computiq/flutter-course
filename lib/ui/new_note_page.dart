import 'package:contacts_01/models/note.dart';
import 'package:flutter/material.dart';

class NewNotePage extends StatefulWidget {
  NewNotePage(this.noteModel);

  final NoteModel noteModel;

  @override
  State<NewNotePage> createState() => _NewNotePageState();
}

class _NewNotePageState extends State<NewNotePage> {
  var _controller = TextEditingController();

  @override
  void initState() {
    _controller.text = widget.noteModel.content;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: TextField(
          autofocus: true,
          keyboardType: TextInputType.multiline,
          maxLines: null,
          controller: _controller,
          onSubmitted: (s) {

          },
          onChanged: (s) {
            widget.noteModel.content = _controller.text;
            debugPrint('s: $s');
          },
        ));
  }
}
