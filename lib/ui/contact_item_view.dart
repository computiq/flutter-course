import 'package:flutter/material.dart';
import 'package:task_2/models/contact.dart';

Widget buildContactItem(Contact _contact) {
  return Card(
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(_contact.image),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  _contact.name,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(_contact.mobileNumber),
              ],
            ),
          ),
          Text(_contact.date.toIso8601String().split('T').first),
          Expanded(
            child: Container(),
          ),
          if (_contact.isIncoming)
            Icon(
              Icons.arrow_downward,
              color: Colors.red,
            )
          else
            Icon(
              Icons.arrow_upward,
              color: Colors.green,
            )
        ],
      ),
    ),
  );
}
