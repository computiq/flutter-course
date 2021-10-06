// ignore: file_names
// ignore_for_file: file_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class IGCard extends StatelessWidget {
  const IGCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var imageUrl =
        'https://images.pexels.com/photos/1544947/pexels-photo-1544947.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500';
    return ListView(children: [
      const SizedBox(
        height: 7,
      ),
      const Text('  Stories'),
      SizedBox(
        height: 100,
        child: ListView(scrollDirection: Axis.horizontal, children: [
          buildPadding(imageUrl),
          buildPadding(imageUrl),
          buildPadding(imageUrl),
          buildPadding(imageUrl),
          buildPadding(imageUrl),
          buildPadding(imageUrl),
          buildPadding(imageUrl),
          buildPadding(imageUrl),
          buildPadding(imageUrl),
          buildPadding(imageUrl)
        ]),
      ),
      buildCard(imageUrl),
      buildCard(imageUrl),
      buildCard(imageUrl),
      buildCard(imageUrl),
      buildCard(imageUrl),
      buildCard(imageUrl),
    ]);
  }

  Card buildCard(String imageUrl) {
    return Card(
      shadowColor: Colors.black,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 5),
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(imageUrl),
                  ),
                ),
                const Text('  UserName'),
              ],
            ),

            Image.network(
              imageUrl,
              height: 300,
              width: double.maxFinite,
              fit: BoxFit.cover,
            ),
            Row(
              children: [
                const Padding(
                  padding: EdgeInsets.all(16),
                  child: Icon(
                    Icons.favorite_outline,
                    color: Colors.black,
                    size: 45,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(16),
                  child: Icon(
                    Icons.send,
                    color: Colors.black,
                    size: 45,
                  ),
                ),
                Expanded(
                  child: Container(),
                ),
                const Padding(
                  padding: EdgeInsets.all(16),
                  child: Icon(
                    Icons.more_vert,
                    color: Colors.black,
                    size: 45,
                  ),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                '25 Likes',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                    fontWeight: FontWeight.w800),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Padding buildPadding(String imageUrl) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 75,
        width: 75,
        decoration: const BoxDecoration(shape: BoxShape.circle),
        child: CircleAvatar(
          backgroundImage: NetworkImage(
            imageUrl,
          ),
        ),
      ),
    );
  }
}
