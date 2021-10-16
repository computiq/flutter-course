import 'dart:math';

import 'package:contacts/const/data.dart';
import 'package:flutter/material.dart';

class Favorite extends StatelessWidget {
  const Favorite({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final List<Map> myProducts = List.generate(
        100000, (index) => {"id": index, "name": "Product $index"}).toList();
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        width: size.width,
        height: size.height,
        child: Column(
          children: [
            SizedBox(
              height: 16,
            ),
            Expanded(
              child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 2 / 2,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                      crossAxisCount: 3),
                  itemCount: list.length,
                  itemBuilder: (BuildContext ctx, index) {
                    return Container(
                      alignment: Alignment.center,
                      child: Text(
                        list[index].name[0],
                        style: TextStyle(fontSize: 36),
                      ),
                      decoration: BoxDecoration(
                          color:
                              Color((Random().nextDouble() * 0xFFFFFF).toInt())
                                  .withOpacity(1.0),
                          shape: BoxShape.circle),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
