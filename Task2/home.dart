import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo2/home.dart';
import 'package:todo2/todo.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Map<String, dynamic> todo = {};
  TextEditingController _controller = new TextEditingController();

  @override
  void initState() {
    _loadData();
  }

  _loadData() async {
    SharedPreferences storage = await SharedPreferences.getInstance();

    if (storage.getString('todo') != null) {
      var storage2 = storage;
      var string = storage2.getString('todo');
      todo = jsonDecode(string!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text('Todo App'),
            backgroundColor: Colors.pink,
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 30,
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: todo.length,
                  itemBuilder: (context, data) {
                    return Dismissible(
                      key: Key('item' + data.toString()),
                      onDismissed: (direction) {
                        todo.remove(todo.keys.elementAt(data));
                        _save();
                      },
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            todo[todo.keys.elementAt(data)] =
                                !todo[todo.keys.elementAt(data)];
                          });
                          _save();
                        },
                        child: TodoItem(
                            name: todo.keys.elementAt(data),
                            isActive: todo.values.elementAt(data)),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Scaffold(
                          appBar: AppBar(
                            backgroundColor: Colors.pink,
                          ),
                          body: Container(
                            child: Column(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: TextFormField(
                                    controller: _controller,
                                    keyboardType: TextInputType.multiline,
                                    maxLines: null,
                                    decoration: InputDecoration(
                                      hintText: 'Write....',
                                    ),
                                  ),
                                ),
                                //actions:
                                FlatButton(
                                  child: Text(
                                    'save',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  onPressed: () {
                                    Navigator.pop(context);
                                    _addTodo();
                                  },
                                ),
                                //child: child)
                              ],
                            ),
                          ))));
            },
            child: Icon(Icons.add),
            backgroundColor: Colors.pink,
          ),
        ),
      ),
    );
  }

  _addTodo() async {
    setState(() {});
    SharedPreferences storage = await SharedPreferences.getInstance();

    if (_controller.text.length > 0) {
      setState(() {
        todo.putIfAbsent(_controller.text, () => false);
        storage.setString('todo', jsonEncode(todo));
      });
    }
    setState(() {});
  }

  _save() async {
    SharedPreferences storage = await SharedPreferences.getInstance();

    storage.setString('todo', jsonEncode(todo));
  }
}
