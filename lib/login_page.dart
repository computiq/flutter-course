import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var emailTextController = TextEditingController();
  var passwordTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    var headerImage = SvgPicture.asset(
        'images/undraw_Login_re_4vu2.svg',
        height: 200,
        semanticsLabel: 'Acme Logo'
    );

    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: headerImage,
        ),
        Container(height: 30,),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Card(
            shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(10), ) ,
            elevation: 0,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                textAlign: TextAlign.center,
                controller: emailTextController,
                decoration: InputDecoration(
                  hintText: 'Email'
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Card(
            elevation: 0,
            shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(10), ) ,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                textAlign: TextAlign.center,
                controller: passwordTextController,
                decoration: InputDecoration(
                    hintText: 'Password'
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: ElevatedButton(onPressed: () {
            if (emailTextController.text.isEmpty) {
              debugPrint('emailTextController.text is empty...');
            }
            debugPrint('emailTextController.text: ${emailTextController.text}');
            debugPrint('passwordTextController.text: ${passwordTextController.text}');
          }, child: Text('Login')),
        )
      ],
    );
  }
}
