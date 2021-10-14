import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30)),
          child: Image.asset(
            'assets/waves.png',
            width: size.width,
            fit: BoxFit.fill,
          ),
        ),
        Positioned(
            height: 50,
            width: size.width * 0.9,
            left: size.width * 0.05,
            top: 27,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SvgPicture.asset(
                  'assets/sort.svg',
                  width: 30,
                ),
                Image.asset(
                  'assets/user.png',
                  width: 40,
                )
              ],
            )),
        Positioned(
            height: 30,
            left: size.width * 0.05,
            top: size.height * 0.12,
            child: const Text(
              'Choose a Car',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.w600),
            )),
        Positioned(
          height: 50,
          left: size.width * 0.05,
          top: size.height * 0.17,
          child: Row(
            children: [
              Container(
                width: size.width * 0.8,
                padding: const EdgeInsets.only(
                    top: 5, bottom: 5, left: 15, right: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15), // radius of 10
                  color: Colors.white,
                ),
                child: Row(
                  children: [
                    const Icon(
                      Icons.location_on_outlined,
                      color: Colors.grey,
                      size: 24,
                    ),
                    const Text(
                      '  Florida, USA',
                      style: TextStyle(
                          color: Colors.black87,
                          fontSize: 17,
                          fontWeight: FontWeight.bold),
                    ),
                    Expanded(
                      child: Container(),
                    ),
                    Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(13), // radius of 10
                            color: const Color(0xfff26cab)),
                        child: const Icon(
                          Icons.date_range_outlined,
                          color: Colors.white,
                        ))
                  ],
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              const Icon(
                Icons.tune_outlined,
                color: Colors.white,
                size: 30,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
