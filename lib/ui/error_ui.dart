import 'package:flutter/material.dart';
import 'package:weather_application/data_proc/fetch_data_api.dart';

Widget GetError(BuildContext context, ErrorResponse? item1) {
  return SingleChildScrollView(
    child: Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Center(
        child: Text(
          '${item1?.message} ',
          style: const TextStyle(
            color: Colors.white,
            fontSize: 50,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    ),
  );
}
