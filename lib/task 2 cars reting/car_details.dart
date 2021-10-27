// import 'package:flutter/material.dart';
// import 'main.dart';
//
// class CarDetailsView extends StatefulWidget {
//   const CarDetailsView({Key? key, required this.car}) : super(key: key);
//   final Car car;
//   @override
//   _CarDetailsViewState createState() => _CarDetailsViewState();
// }
//
// class _CarDetailsViewState extends State<CarDetailsView> {
//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return Scaffold(
//       backgroundColor: Colors.blueGrey.shade50,
//       body: Stack(
//         children: [
//           Positioned(
//             width: size.width,
//             height: size.height * 0.3,
//             top: 0,
//             right: 0,
//             child: ClipRRect(
//               borderRadius: const BorderRadius.only(
//                   bottomLeft: Radius.circular(30),
//                   bottomRight: Radius.circular(30)),
//               child: Image.asset(
//                 'assets/waves.png',
//                 width: size.width,
//                 fit: BoxFit.fill,
//               ),
//             ),
//           ),
//           Positioned(
//             width: size.width * 0.9,
//             height: size.height * 0.4,
//             top: size.height * 0.2,
//             right: size.width * .05,
//             child: Container(
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(50),
//                 boxShadow: [
//                   BoxShadow(
//                       color: Colors.grey.withOpacity(0.2),
//                       blurRadius: 20,
//                       spreadRadius: 0,
//                       offset: const Offset(5, 5))
//                 ],
//               ),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   SizedBox(
//                     height: size.height * .13,
//                   ),
//                   Text(
//                     widget.car.name,
//                     style: const TextStyle(
//                         color: Colors.black87,
//                         fontSize: 25,
//                         fontWeight: FontWeight.w800),
//                   ),
//                   SizedBox(
//                     height: size.height * .02,
//                   ),
//                   const Text(
//                     '4 doors | Sport Package',
//                     style: TextStyle(color: Colors.grey, fontSize: 18),
//                   ),
//                   SizedBox(
//                     height: size.height * .02,
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: const [
//                       Icon(
//                         Icons.star,
//                         color: Colors.amberAccent,
//                         size: 15,
//                       ),
//                       Icon(
//                         Icons.star,
//                         color: Colors.amberAccent,
//                         size: 15,
//                       ),
//                       Icon(
//                         Icons.star,
//                         color: Colors.amberAccent,
//                         size: 15,
//                       ),
//                       Icon(
//                         Icons.star,
//                         color: Colors.amberAccent,
//                         size: 15,
//                       ),
//                       Icon(
//                         Icons.star_outline,
//                         color: Colors.amberAccent,
//                         size: 15,
//                       ),
//                       Text(
//                         '(23.5k)',
//                         style: TextStyle(color: Colors.grey, fontSize: 14, fontWeight: FontWeight.bold),
//                       ),
//                     ],
//                   ),
//                   SizedBox(
//                     height: size.height * .02,
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     children: [
//                       Column(
//                         children: const [
//                           Icon(
//                             Icons.flash_auto_outlined,
//                             color: Colors.black87,
//                           ),
//                           Text('Automatic', style: TextStyle(color: Colors.black54),),
//                         ],
//                       ),
//                       Column(
//                         children: const [
//                           Icon(
//                             Icons.ac_unit,
//                             color: Colors.black87,
//                           ),
//                           Text('Air Con', style: TextStyle(color: Colors.black54)),
//                         ],
//                       ),
//                       Column(
//                         children: const [
//                           Icon(
//                             Icons.person,
//                             color: Colors.black87,
//                           ),
//                           Text('5 Seater', style: TextStyle(color: Colors.black54)),
//                         ],
//                       ),
//                     ],
//                   )
//                 ],
//               ),
//             ),
//           ),
//           Positioned(
//               width: size.width * 0.7,
//               height: size.height * 0.3,
//               top: size.height * 0.06,
//               right: size.width * .15,
//               child: Image.asset(widget.car.image)),
//           Positioned(
//               top: size.height * 0.04,
//               left: size.height * 0.02,
//               width: 30,
//               height: 30,
//               child: IconButton(
//                   onPressed: () {
//                     Navigator.pop(context);
//                   },
//                   icon: const Icon(
//                     Icons.arrow_back_ios,
//                     color: Colors.white,
//                   ))),
//           Positioned(
//               top: size.height * 0.63,
//               left: size.height * 0.03,
//               width: size.width * 0.88,
//               height: size.height * 0.37,
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   const Text(
//                     'Trip Dates',
//                     style: TextStyle(
//                         color: Colors.black87,
//                         fontSize: 1,
//                         fontWeight: FontWeight.w800),
//                   ),
//                   const SizedBox(height: 5),
//                   Row(
//                     children: [
//                       Expanded(
//                         child: ClipPath(
//                           clipper: MyCustomClipper(),
//                           child: Container(
//                             width: size.width * 0.75,
//                             padding: const EdgeInsets.symmetric(
//                                 horizontal: 15, vertical: 10),
//                             decoration: BoxDecoration(
//                               color: Colors.white,
//                               borderRadius: const BorderRadius.only(
//                                   topLeft: Radius.circular(20),
//                                   bottomLeft: Radius.circular(20)),
//                               boxShadow: [
//                                 BoxShadow(
//                                     color: Colors.grey.withOpacity(0.3),
//                                     blurRadius: 20,
//                                     spreadRadius: 0,
//                                     offset: const Offset(5, 5))
//                               ],
//                             ),
//                             child: Row(children: [
//                               Container(
//                                   width: 40,
//                                   height: 40,
//                                   decoration: BoxDecoration(
//                                       borderRadius: BorderRadius.circular(15),
//                                       color: const Color(0xfff26cab)),
//                                   child: const Icon(
//                                     Icons.date_range_outlined,
//                                     color: Colors.white,
//                                   )),
//
//                               const Padding(
//                                 padding: EdgeInsets.all(8.0),
//                                 child: Text(
//                                   '03-07-2020 - 05-07-2020',
//                                   style: TextStyle(
//                                       color: Colors.black87,
//                                       fontSize: 13,
//                                       fontWeight: FontWeight.w600),
//                                 ),
//                               ),
//                             ]),
//                           ),
//                         ),
//                       ),
//                       Container(
//                         width: 50,
//                         height: 50,
//                         decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(20),
//                             color: const Color(0xff2156c0)),
//                         child: const Icon(
//                           Icons.double_arrow_rounded,
//                           color: Colors.white,
//                         ),
//                       )
//                     ],
//                   ),
//                   const SizedBox(height: 10),
//                   const Text(
//                     'Pickup & Return',
//                     style: TextStyle(
//                         color: Colors.black87,
//                         fontSize: 21,
//                         fontWeight: FontWeight.w800),
//                   ),
//                   const SizedBox(height: 10),
//                   Row(
//                     children: [
//                       Expanded(
//                         child: ClipPath(
//                           clipper: MyCustomClipper(),
//                           child: Container(
//                             width: size.width * 0.75,
//                             padding: const EdgeInsets.symmetric(
//                                 horizontal: 15, vertical: 10),
//                             decoration: BoxDecoration(
//                               color: Colors.white,
//                               borderRadius: const BorderRadius.only(
//                                   topLeft: Radius.circular(20),
//                                   bottomLeft: Radius.circular(20)),
//                               boxShadow: [
//                                 BoxShadow(
//                                     color: Colors.grey.withOpacity(0.2),
//                                     blurRadius: 20,
//                                     spreadRadius: 0,
//                                     offset: const Offset(5, 5))
//                               ],
//                             ),
//                             child: Row(children: [
//                               Container(
//                                   width: 40,
//                                   height: 40,
//                                   decoration: BoxDecoration(
//                                       borderRadius: BorderRadius.circular(15),
//                                       color: const Color(0xfff26cab)),
//                                   child: const Icon(
//                                     Icons.location_on,
//                                     color: Colors.white,
//                                   )),
//                               const Text(
//                                 '   Miami, 786 FL',
//                                 style: TextStyle(
//                                     color: Colors.black87,
//                                     fontSize: 16,
//                                     fontWeight: FontWeight.w600),
//                               ),
//                             ]),
//                           ),
//                         ),
//                       ),
//                       Container(
//                         width: 50,
//                         height: 50,
//                         decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(20),
//                             color: const Color(0xff2156c0)),
//                         child: const Icon(
//                           Icons.double_arrow_rounded,
//                           color: Colors.white,
//                         ),
//                       )
//                     ],
//                   ),
//                 ],
//               )),
//           Positioned(
//               top: size.height * 0.91,
//               left: 0,
//               width: size.width,
//               height: size.height * 0.09,
//               child: Container(
//                 width: size.width,
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: const BorderRadius.only(
//                       topLeft: Radius.circular(40),
//                       topRight: Radius.circular(40)),
//                   boxShadow: [
//                     BoxShadow(
//                         color: Colors.grey.withOpacity(0.2),
//                         blurRadius: 20,
//                         spreadRadius: 0,
//                         offset: const Offset(5, 5))
//                   ],
//                 ),
//                 child: Padding(
//                   padding: const EdgeInsets.only(
//                       top: 10, left: 20, right: 20, bottom: 5),
//                   child: Row(
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Expanded(
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             const Text(
//                               'Total',
//                               style: TextStyle(color: Colors.grey, fontSize: 16),
//                             ),
//                             Expanded(
//                               child: Text(
//                                 '${widget.car.price} / trip',
//                                 style: const TextStyle(
//                                     color: Colors.black87,
//                                     fontSize: 18,
//                                     fontWeight: FontWeight.w800),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                       ElevatedButton(
//                         style: ElevatedButton.styleFrom(
//                             elevation: 0,
//                             primary: Colors.redAccent,
//                             shape: const StadiumBorder()),
//                         onPressed: () {},
//                         child: const Text('Go to Checkout'),
//                       ),
//                     ],
//                   ),
//                 ),
//               )),
//         ],
//       ),
//     );
//   }
// }
//
// class MyCustomClipper extends CustomClipper<Path> {
//   @override
//   Path getClip(Size size) {
//     var path = Path();
//     path.moveTo(0, 0);
//     path.lineTo(0, size.height);
//     path.lineTo(size.width + 80, size.height);
//     path.quadraticBezierTo(size.width / 1.15, size.height * 1.45,
//         size.width / 1.013, size.height * 0.035);
//     path.lineTo(size.width, 0);
//     return path;
//   }
//
//   @override
//   bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
//     return true;
//   }
// }
//
