import 'package:flutter/material.dart';
import 'note_model.dart';

class NewNotePage extends StatefulWidget {
  const NewNotePage(this.noteModel);
  final NoteModel noteModel;
  @override
  _NewNotePageState createState() => _NewNotePageState();
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
      appBar: AppBar(
        title: Text('New Note'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextField(
          controller: _controller,
          onChanged: (str) {
            widget.noteModel.content = str;
          },
          decoration: InputDecoration(
            labelText: 'Type your note here',
            labelStyle: TextStyle(color: Colors.grey, fontSize: 20.0),
            // border: InputBorder.none,
          ),
          maxLines: null,
          style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.w500),
          autofocus: true,
          keyboardType: TextInputType.multiline,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        child: Icon(Icons.check),
      ),
    );
  }
}
