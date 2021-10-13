import 'package:flutter/material.dart';
import 'dart:math';

import 'ListViewCar.dart';

Widget BuildSecondPageBody(BuildContext context) {
  return Container(
    height: MediaQuery.of(context).size.height,
    width: MediaQuery.of(context).size.width,
    decoration: BoxDecoration(
      image: DecorationImage(
        image: AssetImage("images/waves.png"),
        fit: BoxFit.fill,
      ),
      borderRadius: BorderRadius.all(Radius.circular(20)),
    ),
    child: Column(children: [
      BuildListViewCars(context),
      Padding(
        padding: const EdgeInsets.all(15),
        child: Row(
          children: [
            Text(
              'Trip Dates',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      Container(
        height: 70,
        width: MediaQuery.of(context).size.width - 50,
        child: CustomPaint(
          painter: CurvePainter(),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    color: Colors.pink,
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                  child: Icon(
                    Icons.date_range_rounded,
                    color: Colors.white,
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      '2020-5-5 2021-5-8',
                      style: TextStyle(color: Colors.grey, fontSize: 15),
                    )),
              ),
              //////////////////////////////////////////////////////////////////////
              //Expanded(child: Container()),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(0),
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () {},
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
              //////////////////////////////////////////////////////////////////////
            ],
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(15),
        child: Row(
          children: [
            Text(
              'Pickup & Return ',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      Container(
        height: 70,
        width: MediaQuery.of(context).size.width - 50,
        child: CustomPaint(
          painter: CurvePainter(),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    color: Colors.pink,
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                  child: Icon(
                    Icons.date_range_rounded,
                    color: Colors.white,
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Iraq, baghdad',
                      style: TextStyle(color: Colors.grey, fontSize: 15),
                    )),
              ),
              //////////////////////////////////////////////////////////////////////
              //Expanded(child: Container()),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(0),
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () {},
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
              //////////////////////////////////////////////////////////////////////
            ],
          ),
        ),
      ),
      Expanded(child: Container()),
      Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(40.0),
            topLeft: Radius.circular(40.0),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 3,
              blurRadius: 5,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        height: 100,
        width: MediaQuery.of(context).size.width,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                      padding: const EdgeInsets.all(4),
                      child: Text(
                        'Total',
                        style: TextStyle(color: Colors.grey, fontSize: 13),
                      )),
                  Padding(
                      padding: const EdgeInsets.all(4),
                      child: Text(
                        '\$999/trip',
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      )),
                ],
              ),
            ),
            Expanded(child: Container()),

            //////////////////////////////////////////////////////////////////////
            //Expanded(child: Container()),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 50,
                width: 150,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                child: Padding(
                    padding: const EdgeInsets.all(0),
                    child: Center(
                      child: Text(
                        'Go to Checkout',
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                    )),
              ),
            ),
            //////////////////////////////////////////////////////////////////////
          ],
        ),
      ),
    ]),
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

    path.lineTo(size.width - 50, size.height);
    path.quadraticBezierTo(
        size.width - 80, size.height / 2, size.width - 50, 0);

    path.lineTo(size.width, 0);

    path.lineTo(20.0, 0);
    path.quadraticBezierTo(0.0, 0.0, 0.0, 20.0);

    //path.lineTo(size.width, 0);

    //path.lineTo(0, 0);
    // canvas.drawRRect(shapeBounds, paint);
    canvas.drawShadow(path, Colors.grey, 2, false);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
/**
 * Stack(
      overflow: Overflow.visible,
      children: [
        Container(
          height: 350,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/waves.png"),
              fit: BoxFit.fill,
            ),
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
        ),
        Positioned(
          width: MediaQuery.of(context).size.width,
          height: 300,
          top: MediaQuery.of(context).size.width / 2,
          //right: MediaQuery.of(context).size.width / 2,
          //  left: MediaQuery.of(context).size.width / 2,
          child: ListView(
            // This next line does the trick.
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  color: Colors.blue,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black54,
                      blurRadius: 10.0,
                      spreadRadius: 2.0,
                      offset: Offset(5.0, 5.0),
                    ),
                  ],
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                ),
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width,
                height: 200,
                child: Text(
                  'Container 3',
                  style: TextStyle(fontSize: 18.0, color: Colors.white),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.blue,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black54,
                      blurRadius: 10.0,
                      spreadRadius: 2.0,
                      offset: Offset(5.0, 5.0),
                    ),
                  ],
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                ),
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width,
                height: 200,
                child: Text(
                  'Container 3',
                  style: TextStyle(fontSize: 18.0, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ],
    ),
 */
