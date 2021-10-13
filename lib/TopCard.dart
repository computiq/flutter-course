import 'package:flutter/material.dart';

import 'ShapedCard.dart';

Widget BuildTopCard(BuildContext context) {
  return SingleChildScrollView(
    child: Column(
      children: [
        Container(
            height: 300,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("images/waves.png"),
                fit: BoxFit.fill,
              ),
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(15, 125, 0, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Expanded(child: Container()),
                  const Text(
                    'Choose a Car',
                    style: TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 8, 8, 8),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 70,
                          width: MediaQuery.of(context).size.width - 75,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: TextField(
                                    autofocus: false,
                                    style: TextStyle(color: Colors.white),
                                    decoration: InputDecoration(
                                      prefixIcon: Icon(
                                        Icons.location_on_outlined,
                                        color: Colors.grey,
                                      ),
                                      border: InputBorder.none,
                                      filled: true,
                                      fillColor: Colors.white,
                                      hintStyle: TextStyle(color: Colors.grey),
                                      hintText: 'Florida, USA',
                                      hoverColor: Colors.grey,
                                    ),
                                  ),
                                ),
                              ),
                              //////////////////////////////////////////////////////////////////////
                              //Expanded(child: Container()),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  height: 50,
                                  width: 50,
                                  decoration: BoxDecoration(
                                    color: Colors.pink,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15)),
                                  ),
                                  child: Icon(
                                    Icons.date_range_rounded,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              //////////////////////////////////////////////////////////////////////
                            ],
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.tune_rounded,
                            color: Colors.white,
                            size: 50,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )),
        ////////////////
        ///
        Padding(
          padding: const EdgeInsets.fromLTRB(15, 30, 15, 30),
          child: Row(
            children: [
              const Text(
                '23 Results',
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.black87,
                    fontWeight: FontWeight.bold),
              ),
              Expanded(child: Container()),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.more_horiz_outlined,
                  color: Colors.black87,
                  size: 40,
                ),
              ),
            ],
          ),
        ),
        BuildShapedCard(context, "images/car1.png", '4.5', 'white Car', 15),
        BuildShapedCard(context, "images/car1.png", '4.5', 'white Car', 15),
      ],
    ),
  );
}
