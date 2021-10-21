import 'package:flutter/material.dart';

class LastUpdatedWidget extends StatelessWidget {
  const LastUpdatedWidget({Key? key, required this.lastUpdatedOn})
      : super(key: key);

  final TimeOfDay lastUpdatedOn;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 20.0, left: 00),
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: []));
  }
}
