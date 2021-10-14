import 'package:car_renting/model/car.dart';
import 'package:flutter/material.dart';

import '../car_details.dart';

class BuildCardView extends StatefulWidget {
  const BuildCardView({Key? key, required this.car}) : super(key: key);
  final Car car;
  @override
  _BuildCardViewState createState() => _BuildCardViewState();
}

class _BuildCardViewState extends State<BuildCardView> {
  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                blurRadius: 20,
                spreadRadius: 0,
                offset: const Offset(5, 5))
          ],
        ),
        child: Stack(
          children: [
            ClipPath(
              clipper: MyCustomClipper(),
              child: Card(
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(35),
                ),
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(30),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 4, horizontal: 7),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(13),
                                color: const Color(0xfffec05f)),
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.star_rounded,
                                  color: Colors.white,
                                  size: 17,
                                ),
                                Text(
                                  ' ${widget.car.rating}',
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 17,
                                      fontWeight: FontWeight.w800),
                                )
                              ],
                            ),
                          ),
                          Text(
                            ' ${widget.car.deals} Deals',
                            style: const TextStyle(
                                color: Color(0xff78c4ad),
                                fontSize: 17,
                                fontWeight: FontWeight.w800),
                          )
                        ],
                      ),
                      Center(
                        child: Image.asset(widget.car.image),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.car.name,
                                style: const TextStyle(
                                    color: Colors.black87,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                'From${widget.car.price} /day',
                                style: const TextStyle(
                                    color: Colors.grey,
                                    fontSize: 17,
                                    fontWeight: FontWeight.w800),
                              )
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              height: 80,
              width: 80,
              bottom: 0,
              right: 0,
              child: IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CarDetailsView(
                                car: widget.car,
                              )),
                    );
                  },
                  icon: Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: const Color(0xff2156c0)),
                    child: const Icon(
                      Icons.double_arrow_rounded,
                      color: Colors.white,
                    ),
                  )),
            )
          ],
        ),
      ),
    );
  }
}

class MyCustomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {

    var path = Path();
    path.moveTo(0, 0);
    path.lineTo(0, size.height);
    path.lineTo(size.width * 0.76, size.height);

    path.quadraticBezierTo(
        size.width / 1.45, size.height * 0.67, size.width, size.height / 1.35);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
