import 'package:flutter/material.dart';

import 'BuilderSecondPage.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_sharp, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: Color(0x00000000),
        elevation: 0,
      ),
      body: SingleChildScrollView(child: BuildSecondPageBody(context)),
    );
  }
}
