import 'package:flutter/material.dart';
import '../models/db_model.dart';
import './todo_card.dart';

class Todolist extends StatelessWidget {
  final Function insertFunction ;
  final Function deleteFunction ;
  final db = DatabaseConnect();

  Todolist({required this.insertFunction,required this.deleteFunction,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FutureBuilder(
        future: db.getTodo(),
        initialData: const [],
        builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
          var data = snapshot.data;
          var dataleangth = data!.length;

          return dataleangth == 0
              ? const Center(
                  child: Text("no data found"),
                )
              : ListView.builder(
                  itemCount: dataleangth,
                  itemBuilder: (context, i) => Todocard(
                    id: data[i].id,
                    title: data[i].title,
                    isChecked: data[i].isChecked,
                    creationDate: data[i].creationDate,
                    deleteFunction: deleteFunction,
                    insertFunction: insertFunction,
                  ),
                );
        },
      ),
    );
  }
}
