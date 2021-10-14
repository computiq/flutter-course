// ignore_for_file: file_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '';

// ignore: import_of_legacy_library_into_null_safe
// import 'package:toast/toast.dart';
import '../main.dart';
import './dataBaseHelper/dataBaseHelper.dart';
import './dataBaseHelper/model.dart';


// ignore: must_be_immutable
class AddNote extends StatefulWidget {
  const AddNote({Key? key}) : super(key: key);

  @override
  _FirstStageScreenState createState() => _FirstStageScreenState();
}

class _FirstStageScreenState extends State<AddNote> {
  // late String noteContent;
  late String noteContent;

  // int sid = 1;

  late DatabaseHelper helper;

  @override
  void initState() {
    super.initState();
    helper = DatabaseHelper();
  }

  @override
  Widget build(BuildContext context) {
    const snackBar = SnackBar(content: Text('Note is Empty!'));
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Note"),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: ()async {
            Model notes = Model(
                content: noteContent,
                noteDate: DateTime.now().toIso8601String(),
                end: 'false');
            int id = await helper.create(notes);
            debugPrint('$id');
            Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) => const MyHomePage(
                  title: 'To Do List',
                )));
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(children: [
          TextFormField(
            // style: const TextStyle(color: Colors.white),
            onChanged: (value) {
              noteContent = value;
            },
            minLines: 2,
            maxLines: 100,
            keyboardType: TextInputType.multiline,
            decoration: const InputDecoration(
                hintText: 'Enter Your Note ',
                hintStyle: TextStyle(color: Colors.grey, fontSize: 18),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    gapPadding: 20)),
          ),
          ElevatedButton.icon(
            icon: const Icon(Icons.save),
            label: const Text('Save', style: TextStyle(fontSize: 25)),
            onPressed: () async {
              Model notes = Model(
                  content: noteContent,
                  noteDate: DateTime.now().toIso8601String(),
                  end: 'false');
              int id = await helper.create(notes);
              debugPrint('$id');
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => const MyHomePage(
                        title: 'To Do List',
                      )));
            },
          )
        ]),
      ),
    );
  }
}
