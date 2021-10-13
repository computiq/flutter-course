import 'package:flutter/material.dart';
import 'dart:math';

Widget BuildListViewCars(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.fromLTRB(0, 150, 0, 0),
    child: Stack(
      overflow: Overflow.visible,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(50)),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black,
                blurRadius: 8,
                spreadRadius: 1,
                offset: Offset(1, 1),
              ),
            ],
          ),
          alignment: Alignment.centerRight,
          width: 300,
          height: 300,
          child: Text(
            'Container 1',
            style: TextStyle(fontSize: 18.0, color: Colors.white),
          ),
        ),
        Positioned(
          left: 40,
          top: -70,
          child: Column(
            children: [
              Image.asset(
                'images/car1.png',
                scale: 5,
              ),
              Text(
                'White Car',
                style: TextStyle(
                    color: Colors.black54,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                '4 Doors | Sport',
                style: TextStyle(
                    color: Colors.black54,
                    fontSize: 15,
                    fontWeight: FontWeight.normal),
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Row(
                  children: [
                    Icon(
                      Icons.star,
                      color: Colors.yellow,
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.yellow,
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.yellow,
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.yellow,
                    ),
                    Icon(
                      Icons.star_border_outlined,
                      color: Colors.yellow,
                    ),
                    Text(
                      '(33k)',
                      style: TextStyle(
                          color: Colors.black54,
                          fontSize: 15,
                          fontWeight: FontWeight.normal),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Icon(
                          Icons.autorenew_rounded,
                          size: 30,
                        ),
                        Text(
                          'Automatic',
                          style: TextStyle(
                              color: Colors.black54,
                              fontSize: 15,
                              fontWeight: FontWeight.normal),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Icon(
                          Icons.ac_unit,
                          size: 30,
                        ),
                        Text(
                          'Air Con',
                          style: TextStyle(
                              color: Colors.black54,
                              fontSize: 15,
                              fontWeight: FontWeight.normal),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Icon(
                          Icons.person,
                          size: 30,
                        ),
                        Text(
                          '5 Seater',
                          style: TextStyle(
                              color: Colors.black54,
                              fontSize: 15,
                              fontWeight: FontWeight.normal),
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    ),
  );
}
