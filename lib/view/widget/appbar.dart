import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:weather/controller/controller.dart';
import 'package:weather/model/cities.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final MainController cityController = Get.find();
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () {},
              child: SvgPicture.asset('assets/sort.svg',
                  height: size.height * 0.015,
                  width: size.width * 0.015,
                  fit: BoxFit.scaleDown),
            ),
            IconButton(
                onPressed: () {
                  Get.defaultDialog(
                    title: 'Select City',
                    titleStyle: TextStyle(
                        fontWeight: FontWeight.w700, color: Colors.black87),
                    backgroundColor: Colors.white,
                    radius: 15,
                    content: Container(
                      height: size.height * 0.7,
                      width: size.width * 0.8,
                      child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: false,
                        itemCount: Citys.length,
                        itemBuilder: (_context, index) {
                          return Container(
                            decoration: BoxDecoration(
                              color: Colors.blueGrey.shade50,
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10)),
                            ),
                            margin: EdgeInsets.all(5),
                            child: ListTile(
                              onTap: () {
                                cityController.getCityID(
                                    Citys[index].id, Citys[index].name);
                                Get.back();
                              },
                              title: Text(
                                '${Citys[index].name}',
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 19),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  );
                },
                icon: Icon(
                  Icons.more_horiz,
                  size: size.width * 0.09,
                  color: Colors.black87,
                )),
          ],
        ),
      ),
    );
  }
}
