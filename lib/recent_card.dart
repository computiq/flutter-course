import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ResentCard extends StatelessWidget {
  String image, name, mobileNumber;
  DateTime callDate = DateTime.now();
  bool isIncoming;

  ResentCard(
      {Key? key,
      required this.image,
      required this.name,
      required this.mobileNumber,
      required this.callDate,
      required this.isIncoming})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(10),
        child: Card(
          child: Row(
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(image),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(mobileNumber),
                  ],
                ),
              ),
              Text(callDate.toIso8601String().split('T').first),
              Expanded(
                child: Container(),
              ),
              if (isIncoming)
                const Icon(
                  Icons.arrow_downward,
                  color: Colors.red,
                )
              else
                const Icon(
                  Icons.arrow_upward,
                  color: Colors.green,
                )
            ],
          ),
        ));
  }
}
