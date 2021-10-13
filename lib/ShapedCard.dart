import 'package:flutter/material.dart';
import 'dart:math';

import 'SecondPage.dart';

Widget BuildShapedCard(BuildContext context, String image, String star,
    String description, int deals) {
  return Padding(
    padding: const EdgeInsets.all(10),
    child: Container(
      height: 300,
      width: MediaQuery.of(context).size.width - 50,
      child: CustomPaint(
        painter: CurvePainter(),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  Container(
                    height: 35,
                    width: 60,
                    decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(6),
                      child: Row(
                        children: [
                          Icon(
                            Icons.star,
                            color: Colors.white,
                            size: 20,
                          ),
                          Text(
                            star,
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                  ),

                  ////text
                  ///
                  Expanded(child: Container()),
                  Text(
                    '$deals Deals',
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.green[200],
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            Center(
              child: Image.asset(
                image, //"images/car1.png",
                scale: 5,
              ),
            ),
            Expanded(child: Container()),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(5),
                        child: Text(
                          description,
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.black87,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Text(
                        'From \$192/per day',
                        style: TextStyle(
                            fontSize: 10,
                            color: Colors.black87,
                            fontWeight: FontWeight.normal),
                      ),
                    ],
                  ),
                  Expanded(child: Container()),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 20, 0, 0),
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            blurRadius: 5,
                            spreadRadius: 1,
                            offset: Offset(2, 2),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(0),
                        child: Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SecondPage()),
                                );
                              },
                              icon: Icon(
                                Icons.double_arrow_rounded,
                                color: Colors.white,
                                size: 20,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    ),
  );
}

class CurvePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = Colors.white;

    //canvas.drawPath(backgroundPath, paint);

    var path = Path();
    path.lineTo(0, size.height - 20);
    path.quadraticBezierTo(0.0, size.height, 20.0, size.height);

    path.lineTo(size.width - 90, size.height);

    path.lineTo(size.width - 70, size.height);
    path.quadraticBezierTo(
        size.width - 85, size.height - 85, size.width, size.height - 70);
    path.lineTo(size.width, size.height - 70);

    path.lineTo(size.width, 20);
    path.quadraticBezierTo(size.width, 10, size.width - 10, 0);

    path.lineTo(20.0, 0);
    path.quadraticBezierTo(0.0, 0.0, 0.0, 20.0);

    //path.lineTo(size.width, 0);

    //path.lineTo(0, 0);
    // canvas.drawRRect(shapeBounds, paint);
    canvas.drawShadow(path, Colors.grey, 10, false);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
