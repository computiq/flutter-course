// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Details extends StatelessWidget {
  final String contact_name;
  final String number;
  final String image;
  final DateTime date;
  final bool isCom;

  const Details(
      {Key? key,
      required this.date,
      required this.image,
      required this.contact_name,
      required this.number,
      required this.isCom})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(contact_name),
        centerTitle: true,
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: Image(
                image: NetworkImage(image),
              ),
            ),

            Row(mainAxisAlignment: MainAxisAlignment.center,

              children: [

                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(

                      children: [
                        const SizedBox(width: 50  ,),
                        IconButton(icon: const Icon(Icons.call),onPressed: (){},), const Text('Call'),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(

                      children: [
                        const SizedBox(width: 50  ,),
                        IconButton(icon: const Icon(Icons.message),onPressed: (){},), const Text('Message'),
                      ],
                    ),
                  ),
                ),

              ],
            ),

            SizedBox(
              width: double.maxFinite,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Text(
                          number,
                        ),
                        // ignore: prefer_const_constructors
                        Text("    "),
                        Text(date.toIso8601String().split('T').first),
                        Expanded(child: Container()),
                        if (isCom)
                          Row(
                            children: const [
                              Text('Incoming Call'),
                              Icon(
                                Icons.arrow_downward,
                                color: Colors.red,
                              )
                            ],
                          )
                        else
                          Row(
                            children: const [
                              Text('Outgoing Call'),
                              Icon(
                                Icons.arrow_upward,
                                color: Colors.green,
                              )
                            ],
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
