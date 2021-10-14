import 'package:flutter/material.dart';
import '../main.dart';
import './dataBaseHelper/dataBaseHelper.dart';
import './dataBaseHelper/model.dart';

// ignore: must_be_immutable
class EditPage extends StatefulWidget {
  Model model;
  int noteID;

  EditPage(this.model, this.noteID, {Key? key}) : super(key: key);

  @override
  _EditPageState createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {

  TextEditingController noteContent = TextEditingController();

  late DatabaseHelper helper;

  @override
  void initState() {
    super.initState();
    helper = DatabaseHelper();
    noteContent.text = widget.model.content;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Edit Note'),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              // print("ID= ${widget.model.id}");
              var editNote = Model(
                  id: widget.model.id,
                  content: noteContent.text,
                  noteDate: DateTime.now().toIso8601String(),
                  end: 'false'
              );

              helper.edit(editNote);
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => const MyHomePage(title: 'To Do List ')));
            },
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: ListView(
            children: <Widget>[
              TextField(
                controller: noteContent,
decoration: const InputDecoration(
    border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        gapPadding: 20
    )
),
              ),

              ElevatedButton.icon(
                icon: const Icon(Icons.save),
                label: const Text('Save', style: TextStyle(fontSize: 25)),
                onPressed: () {
                  // print("ID= ${widget.model.id}");
                  var editNote = Model(
                    id: widget.model.id,
                    content: noteContent.text,
                    noteDate: DateTime.now().toIso8601String(),
                    end: 'false'
                  );

                  helper.edit(editNote);
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => const MyHomePage(title: 'To Do List ')));
                },
              ),
            ],
          ),
        ));
  }
}
