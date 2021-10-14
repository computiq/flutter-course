import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:todo2/checkBox.dart';

class TodoItem extends StatefulWidget {
  final String name;
  final bool isActive;

  const TodoItem({Key? key, required this.name, required this.isActive})
      : super(key: key);

  @override
  _TodoItemState createState() => _TodoItemState();
}

class _TodoItemState extends State<TodoItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 50),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: MediaQuery.of(context).size.width / 100 * 50,
            child: Text(
              widget.name,
              style: TextStyle(
                fontSize: 17,
                color: Colors.black,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              softWrap: true,
            ),
          ),
          /////////////////////////////////
          Row(
            children: [
              Text(
                DateFormat('d ').format(DateTime.now()),
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.black45),
              ),
              Text(
                DateFormat('MMM ').format(DateTime.now()).toUpperCase(),
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.black45),
              ),
              Text(
                DateFormat('y').format(DateTime.now()),
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.black45),
              ),
            ],
          ),

          /////////////////////////////////
          Check(
            isActive: widget.isActive,
          )
        ],
      ),
    );
  }
}
