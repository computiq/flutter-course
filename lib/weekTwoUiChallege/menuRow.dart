// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
class MenuRow extends StatefulWidget {
  const MenuRow({Key? key}) : super(key: key);

  @override
  State<MenuRow> createState() => _MenuRowState();
}

class _MenuRowState extends State<MenuRow> {
  bool isActive=true;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 18.0),
      child: Column(
        children: [
          buildMenuRowPadding(),
          const SizedBox(height: 10,),
          SizedBox(
            height: 45,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [

                Row(
                  children: [
                    buildElevatedButton(
                        Icons.help_outlined,
                        const Color(0xff61bf89),
                        'Ayuda y soporte'),
                    buildElevatedButton(
                        Icons.settings,
                        const Color(0xff1977f3),
                        'Configuration in spanish'),
                    buildElevatedButton(Icons.not_accessible,
                        const Color(0xff61bf89), 'out of range'),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 10,),

        ],
      ),
    );
  }
  Padding buildMenuRowPadding() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [

          const Padding(
            padding: EdgeInsets.only(left: 12.0, top: 5),
            child: Text(
              'Menu ',
              textAlign: TextAlign.start,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
          ),
          Expanded(
            child: Container(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
               const Padding(
                padding:  EdgeInsets.all(0.0),
               child:Icon(Icons.dark_mode,color: Colors.white,)

              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Modo oscuro',
                  style: TextStyle(color: Colors.white,fontSize: 10),
                ),
              ),
              Container(

                child: CupertinoSwitch(
                  value: isActive,
                  onChanged: (bool value) {
                    setState(() {
                      isActive = value;
                    });
                  },
                  activeColor: Colors.blue,
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget buildElevatedButton(
      IconData buttonIcon, Color iconColor, String buttonName) =>
      Padding(
        padding: const EdgeInsets.only(left: 8.0, right: 8.0),
        child:Container(
          decoration: BoxDecoration(
              color: const Color(0xff282e39),
              borderRadius: BorderRadius.circular(15)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  width: 15,
                ),
               Icon(buttonIcon,color: iconColor,),
                const SizedBox(
                  width: 15,
                ),
                Text(
                  buttonName,
                  style: const TextStyle(color: Colors.white, fontSize: 11),
                ),
              ],
            ),
          ),
        ),



      );
}
