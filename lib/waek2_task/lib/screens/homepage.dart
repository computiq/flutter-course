import 'package:flutter/material.dart';
import 'package:waek2_task/models/db_model.dart';
import 'package:waek2_task/models/todo_model.dart';
import '../widgets/user_input.dart';
import '../widgets/todo_list.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  var db = DatabaseConnect();

  void addItem(ToDo todo) async {
    await db.insertTodo(todo);
    setState(() {});
  }

  void deleteItem(ToDo todo) async {
    await db.deleteTodo(todo);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: const Color(0xFFF5EBFF),
      appBar: AppBar(
        title: const Text("Simple Todo App"),
      ),
      body: Column(
        children: [
          Todolist(insertFunction: addItem,deleteFunction: deleteItem,),
          UserInput(
            insertFunction: addItem,
          ),
        ],
      ),
    );
  }
}
