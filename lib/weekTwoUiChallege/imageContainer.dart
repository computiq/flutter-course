// ignore_for_file: file_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ImageContainer extends StatelessWidget {
  const ImageContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 160,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          Stack(
            children: [
              buildBottomContainer(),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: Colors.white),
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Image(
                      image: AssetImage('images/reload.png'),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 120, top: 90),
                child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white54,
                        borderRadius: BorderRadius.circular(12)),
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Hace 3 anos',
                        style: TextStyle(fontSize: 10),
                      ),
                    )),
              ),
            ],
          ),
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              buildBottomContainer2(),
              Padding(
                padding: const EdgeInsets.only(bottom: 30, left: 15),
                child: Image.asset('images/33.png'),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 90.0),
                child: Image.asset(
                  'images/19.png',
                  width: 10,
                  height: 10,
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(bottom: 105.0),
                child: Text(
                  'Centro de informacion\nCOVID-19',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 35),
                child: Row(
                  children: [
                    Image.asset('images/151.png'),
                    Image.asset('images/153.png'),
                    Image.asset('images/137.png'),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

Padding buildBottomContainer() {
  return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Container(
            width: 200,
            height: 125,
            decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24.0),
                ),
                image: const DecorationImage(
                    image: AssetImage('images/3.png'), fit: BoxFit.cover)),
            child: const Center(),
          ),
        ],
      ));
}

Padding buildBottomContainer2() {
  return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Container(
            width: 210,
            height: 125,
            decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24.0),
                ),
                image: const DecorationImage(
                    image: AssetImage('images/Rectangle.png'),
                    fit: BoxFit.cover)),
          ),
        ],
      ));
}

Widget buildElevatedButton(
        IconData buttonIcon, Color iconColor, String buttonName) =>
    Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          primary: const Color(0xff292f3b),
        ),
        onPressed: () {},
        icon: Icon(
          buttonIcon,
          color: iconColor,
        ),
        label: Text(buttonName),
      ),
    );
