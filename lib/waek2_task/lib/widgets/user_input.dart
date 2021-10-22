import 'package:flutter/material.dart';
import 'package:waek2_task/models/todo_model.dart';

class UserInput extends StatelessWidget {
  final textController = TextEditingController();
  final Function insertFunction;

  UserInput({required this.insertFunction, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFDAB5FF),
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 8),
      child: Row(
        children: [
          Expanded(
              child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: TextField(
              controller: textController,
              decoration: const InputDecoration(
                hintText: "add new todo",
                border: InputBorder.none,
              ),
            ),
          )),
          const SizedBox(
            width: 10,
          ),
          GestureDetector(
            onTap: () {
              var myTodo = ToDo(
                  title: textController.text,
                  creationDate: DateTime.now(),
                  isChecked: false);
              insertFunction(myTodo);
            },
            child: Container(
              color: Colors.red,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: const Text(
                "add",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
