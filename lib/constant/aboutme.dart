import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

String userimage = 'https://avatars.githubusercontent.com/u/38259126?v=4';

Widget buildAboutMe() {
  return Padding(
    padding: const EdgeInsets.all(20.0),
    child: Card(
      elevation: 7,
      child: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Zayn_n97',
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 25,
                ),
              ),
              const SizedBox(height: 30),
              CircleAvatar(
                radius: 60.0,
                backgroundImage: NetworkImage(userimage),
                backgroundColor: Colors.transparent,
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  socialButtons(
                      bgColor: Colors.blue,
                      color: Colors.white,
                      icon: FontAwesomeIcons.facebook,
                      fctn: _facebooklauncher),
                  socialButtons(
                      bgColor: Colors.deepPurpleAccent,
                      color: Colors.white,
                      icon: FontAwesomeIcons.envelope,
                      fctn: _sendEmail),
                  socialButtons(
                      bgColor: Colors.blue.shade200,
                      color: Colors.white,
                      icon: FontAwesomeIcons.telegram,
                      fctn: _openTelegram),
                ],
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

Widget socialButtons(
    {required Color bgColor,
    required Color color,
    required IconData icon,
    required Function fctn}) {
  return CircleAvatar(
    radius: 25,
    backgroundColor: bgColor,
    child: IconButton(
      icon: Icon(
        icon,
        color: color,
      ),
      onPressed: () {
        fctn();
      },
    ),
  );
}

void _openTelegram() async {
  await launch('https://t.me/zayn_n97');
}

void _sendEmail() async {
  await launch('mailto:zicoraa@gmail.com');
}

void _facebooklauncher() async {
  await launch('https://www.facebook.com/zayn.n97');
}
