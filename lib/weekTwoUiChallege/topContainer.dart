// ignore_for_file: file_names

import 'package:flutter/material.dart';
class TopContainer extends StatelessWidget {
  const TopContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: Color(0xff222833),
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(25),
              bottomRight: Radius.circular(25))),
      height: 125,
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          const TextField(
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
              border: InputBorder.none,
              suffixIcon: Image(image: AssetImage('images/smile.png',)),
              prefixIcon: SizedBox(
                height: 25,
                width: 25,
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    backgroundImage: AssetImage('images/46.png'),
                  ),
                )
              ),
              hintText: 'What are you think about?',
              hintStyle: TextStyle(color: Colors.white),
            ),
          ),
          Row(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              buildElevatedButton(
                  Icons.camera_alt, const Color(0xff61bf89), 'Fotos'),
              buildElevatedButton(Icons.video_call,
                  const Color(0xfff31954), 'En vivio'),
              buildElevatedButton(Icons.remove_red_eye,
                  const Color(0xff1977f3), 'Video corto'),
            ],
          )
        ],
      ),
    );
  }


  Widget buildElevatedButton(
      IconData buttonIcon, Color iconColor, String buttonName) =>
      Padding(
        padding: const EdgeInsets.all(4.0),
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 8.0),
          child:Container(

            width: 105,
            decoration: BoxDecoration(
                color: const Color(0xff282e39),
                borderRadius: BorderRadius.circular(15)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  Icon(buttonIcon,color: iconColor,),
                  const SizedBox(
                    width: 3,
                  ),
                  Text(
                    buttonName,
                    style: const TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ],
              ),
            ),
          ),



        )



      );


}
