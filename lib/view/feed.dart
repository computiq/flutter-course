import 'package:car_renting/model/car.dart';
import 'package:flutter/material.dart';
import 'widget/app_bar.dart';
import 'widget/cars_cards.dart';

class CarFeedPage extends StatelessWidget {
  const CarFeedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: const Color(0xfffcfcfc),
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(180), child: MyAppBar()),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 17, left: 17, right: 17),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  '23 Results',
                  style: TextStyle(
                      color: Colors.black87,
                      fontSize: 21,
                      fontWeight: FontWeight.w700),
                ),
                Icon(
                  Icons.more_horiz,
                  color: Colors.black87,
                  size: 33,
                )
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemBuilder: (_context, index) {
                return BuildCardView(
                  car: cars[index],
                );
              },
              itemCount: cars.length,
            ),
          ),
        ],
      ),
    );
  }
}
