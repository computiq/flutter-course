// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class LastPadding extends StatelessWidget {
  const LastPadding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 12.0, right: 12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,

        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Stack(
                  alignment: Alignment.topRight,
                  children:[ buildUnderElevatedButton('images/14.png', 'Video en Watch'),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset('images/30.png'),
              ),
              ]),
              buildSizedBox(),
              Stack(
                alignment: Alignment.topRight,
                children: [
                  buildUnderElevatedButton('images/9.png', 'Parejas'),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Row(
                      children: [
                        Image.asset('images/101.png'),
                        Image.asset('images/100.png'),
                        Image.asset('images/102.png'),

                      ],
                    ),
                  )
                ],
              ),
              buildSizedBox(),
              buildUnderElevatedButton('images/bag.png', 'Empleos'),
            ],
          ),
          Column(
            children: [
              Stack(
                  alignment: Alignment.topRight,
                  children:[ buildUnderElevatedButton('images/25.png', 'Marketplace'),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset('images/30.png'),
                ),
              ]),
              buildSizedBox(),
              Stack(
                alignment: Alignment.topRight,

                children: [
                  buildUnderElevatedButton('images/games.png', 'Videojuegos'),

               Row(
                 children: [
                   Stack(
                     alignment: Alignment.center,
                     children: [
                       Image.asset('images/11.png'),
                       Image.asset('images/8.png'),

                     ],),
                   Stack(
                     alignment: Alignment.center,
                     children: [
                       Image.asset('images/12.png'),
                       Image.asset('images/heart.png'),

                     ],),
                 ],
               )

                ],
              ),
              buildSizedBox(),
              buildUnderElevatedButton('images/bookmark.png', 'Guardados'),
            ],
          ),
        ],
      ),
    );
  }

  SizedBox buildSizedBox() => const SizedBox(
        height: 10,
      );

  Widget buildUnderElevatedButton(String icon, String buttonName) {
    return SizedBox(
        width: 175,
        height: 60,
        child: Container(

          decoration: BoxDecoration(
              color: const Color(0xff282e39),
              borderRadius: BorderRadius.circular(18)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  width: 15,
                ),
                Image.asset(icon),
                const SizedBox(
                  width: 15,
                ),
                Text(
                  buttonName,
                  style: const TextStyle(color: Colors.white, fontSize: 12),
                ),
              ],
            ),
          ),
        ));
  }
}
