import 'package:flutter/material.dart';

Widget genderWidget({
  required String imagePath,
  required String gender,
  required bool selected,
}) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15),
      color: const Color(0xff1A1F38),
      border: Border.all(
        color: selected ? Colors.white : Colors.transparent,
        width: 2.0,
      ),
    ),
    height: 159,
    width: 136,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Image.asset(imagePath),
        Text(
          gender,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: selected ? Colors.white : Colors.white.withOpacity(0.6),
            fontSize: 24,
          ),
        ),
      ],
    ),
  );
}
