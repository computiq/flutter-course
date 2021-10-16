
import 'package:flutter/material.dart';
import 'dart:math' as math;
import '../data.dart';

Widget buildFavoritesGridView() {
  return Column(
    children: [
      Text('Favorites'),
      Divider(
        thickness: 4,
      ),
      Expanded(
        child: GridView.count(
          crossAxisCount: 3,
          children: List.generate(5, (index) {
            var personColor = Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0);
            return Center(
              child: Container(
                width: 120,
                height: 120,
                child: Text(
                  contacts[index].name[0],
                  style: TextStyle(fontSize: 40),
                ),
                alignment: Alignment.center,
                decoration: BoxDecoration(shape: BoxShape.circle, color: personColor),
              ),
            );
          }),
        ),
      ),
    ],
  );
}
