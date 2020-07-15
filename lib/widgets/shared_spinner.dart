import 'package:flutter/material.dart';

Widget sharedSpinner(double width, double height) {
  return Center(
    child: SizedBox(
      height: width,
      width: height,
      child: CircularProgressIndicator(
        strokeWidth: 8,
      ),
    ),
  );
}
