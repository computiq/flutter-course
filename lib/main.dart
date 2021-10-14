import 'package:flutter/material.dart';
import 'dart:async';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import './WeekTwoToDoList/addNewNote.dart';
import './WeekTwoToDoList/cheked.dart';
import './WeekTwoToDoList/dataBaseHelper/model.dart';
import './WeekTwoToDoList/edit.dart';

import 'WeekTwoToDoList/cheked.dart';
import 'WeekTwoToDoList/dataBaseHelper/dataBaseHelper.dart';
import './WeekTwoToDoList/dataBaseHelper/dataBaseHelper.dart';

void main() async {
  runApp(const MyApp());
  WidgetsFlutterBinding.ensureInitialized();
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: const MyHomePage(title: 'To Do List'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late DatabaseHelper helper;
  bool isChecked = false;

  @override
  void initState() {
    super.initState();
    helper = DatabaseHelper();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          centerTitle: true,
          bottom: const TabBar(
            tabs: [
              Icon(Icons.note),
              Icon(Icons.check_box_outlined),
            ],
          ),
        ),
        body: TabBarView(children: [
          buildDataRetriveFutureBuilder(),
          const Checked(),
        ]),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => const AddNote()));
          },
          tooltip: 'Add',
          child: const Icon(Icons.add),
        ),
      ),
    );
  }

  FutureBuilder<List<dynamic>> buildDataRetriveFutureBuilder() {
    return FutureBuilder(
      future: helper.allNotes(),
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
                              style: const TextStyle(fontSize: 20),
                            ),
                          ),
                          Expanded(
                            child: Text(savedNote.noteDate.split('T').first),
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
                                                            builder: (context) =>const MyHomePage(title: 'To Do List')));
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
                          Checkbox(
                              value: isChecked,
                              onChanged: (val) {
                                setState(
                                  () {
                                    isChecked = val!;
                                    var editNote = Model(
                                        id: savedNote.id,
                                        content: savedNote.content,
                                        noteDate:
                                            DateTime.now().toIso8601String(),
                                        end: 'true');

                                    helper.edit(editNote);
                                    Navigator.of(context).pushReplacement(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const MyHomePage(
                                                    title: 'To Do List ')));
                                  },
                                );
                              })
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
