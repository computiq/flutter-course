import 'package:flutter/material.dart';

import '../main.dart';
import 'dataBaseHelper/dataBaseHelper.dart';
import 'dataBaseHelper/model.dart';
import 'edit.dart';

class Checked extends StatefulWidget {
  const Checked({Key? key}) : super(key: key);

  @override
  _CheckedState createState() => _CheckedState();
}


class _CheckedState extends State<Checked> {
  late DatabaseHelper helper;

  @override
  void initState() {
    super.initState();
    helper = DatabaseHelper();
  }

  @override
  Widget build(BuildContext context) {
    return buildDataRetriveFutureBuilder();
  }
  FutureBuilder<List<dynamic>> buildDataRetriveFutureBuilder() {
    return FutureBuilder(
      future: helper.checkedNotes(),
      builder: (context, AsyncSnapshot snapshot) {
        if (!snapshot.hasData) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, i) {
                Model savedNote = Model.fromMap(snapshot.data[i]);

                return Card(
                  child: InkWell(
                    onTap: () {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) {
                            return EditPage(savedNote, savedNote.ID);
                          }));
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              savedNote.content,
                              maxLines: 1,
                              softWrap: true,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(fontSize: 15),
                            ),
                          ),
                          Expanded(
                            child:
                            Text('Work has been completed in ${savedNote.noteDate.split('T').first}'),
                          ),
                          IconButton(
                            icon: const Icon(Icons.remove_circle_outline),
                            onPressed: () {
                              setState(() {

                                final AlertDialog alert = AlertDialog(
                                  title: const Text("Are you sure?"),
                                  content: SizedBox(
                                      height: 95,
                                      child: Column(
                                        children: [
                                          const Divider(color: Colors.red),
                                          const Text(
                                              "Are you sure you want to delete?"),
                                          const SizedBox(height: 10),
                                          Row(
                                            children: [
                                              ElevatedButton.icon(
                                                icon: const Icon(Icons.arrow_back_ios),

                                                style: ButtonStyle(
                                                    backgroundColor: MaterialStateProperty.all(Colors.greenAccent)
                                                ),
                                                label: const Text(
                                                  "Cancel",
                                                  style: TextStyle(color: Colors.white),
                                                ),
                                                onPressed: () {
                                                  setState(() {
                                                    Navigator.pop(context);
                                                  });
                                                },
                                              ),
                                              const Expanded(child: SizedBox()),
                                              ElevatedButton.icon(
                                                icon: const Icon( Icons.delete),
                                                style: ButtonStyle(
                                                    backgroundColor: MaterialStateProperty.all(Colors.redAccent)
                                                ),
                                                label: const Text(
                                                  "Delete",
                                                  style: TextStyle(color: Colors.white),
                                                ),
                                                onPressed: () {
                                                  setState(() {
                                                    helper.delete(savedNote.ID);
                                                    Navigator.pushReplacement(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder: (context) =>
                                                            const MyHomePage(title: 'To Do List')));
                                                  });
                                                },
                                              ),
                                            ],
                                          ),
                                        ],
                                      )),
                                );
                                showDialog(context: context, builder: (context)=>alert);

                              });
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              });
        }
      },
    );
  }

}
