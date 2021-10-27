// import 'first_page.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
//
// void main() {
//   SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
//     statusBarColor: Colors.transparent,
//     statusBarIconBrightness: Brightness.light,
//   ));
//   runApp(const MyApp());
// }
//
// class Car {
//   String name;
//   String image;
//   int price;
//   double rating;
//   int deals;
//
//   Car(
//       {required this.image,
//         required this.name,
//         required this.price,
//         required this.rating,
//         required this.deals});
// }
//
// List<Car> cars = [
//   Car(
//       image: 'images/car2.png',
//       name: ' BMW',
//       price: 199,
//       rating: 4.3,
//       deals: 15),
//   Car(
//       image: 'images/car1.png',
//       name: ' Audi',
//       price: 299,
//       rating: 4.8,
//       deals: 27),
// ];
//
// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: ' Rating Cars ',
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: const CollectionPage(),
//     );
//   }
// }
//
//
//
//
// class CollectionPage extends StatelessWidget {
//   const CollectionPage({Key? key}) : super(key: key);
//
//
//   @override
//   Widget build(BuildContext context) {
//
//     return Scaffold(
//       backgroundColor: const Color(0xfffcfcfc),
//       appBar: const PreferredSize(
//           preferredSize: Size.fromHeight(180), child: MyAppBar()),
//       body: Column(
//         children: [
//           Container(
//             padding: const EdgeInsets.only(top: 17, left: 17, right: 17),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: const [
//                 Text(
//                   '23 Results',
//                   style: TextStyle(
//                       color: Colors.black87,
//                       fontSize: 21,
//                       fontWeight: FontWeight.w700),
//                 ),
//                 Icon(
//                   Icons.more_horiz,
//                   color: Colors.black87,
//                   size: 33,
//                 )
//               ],
//             ),
//           ),
//           Expanded(
//             child: ListView.builder(
//               scrollDirection: Axis.vertical,
//               shrinkWrap: true,
//               itemBuilder: (_context, index) {
//                 return BuildCardView(
//                   car: cars[index],
//                 );
//               },
//               itemCount: cars.length,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
