import 'package:flutter/material.dart';

class ContactCard extends StatelessWidget {
  final String name, image, mobileNumber;
  const ContactCard({
    Key? key,
    required this.name,
    required this.image,
    required this.mobileNumber,
  }) : super(key: key);

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
          ],
        ),
      ),
    );
  }
}
