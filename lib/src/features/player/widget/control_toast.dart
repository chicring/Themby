

import 'package:flutter/material.dart';


Widget textToast(String text) {
  return FractionalTranslation(
    translation: const Offset(0.0, 0.3),
    child: Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: const Color(0x88000000),
        borderRadius: BorderRadius.circular(16),
      ),
      height: 32,
      width: 80,
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 13,
        ),
      ),
    ),
  );
}

Widget iconToast(String text,IconData icon) {
  return FractionalTranslation(
    translation: const Offset(0.0, 0.3),
    child: Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: const Color(0x88000000),
        borderRadius: BorderRadius.circular(16),
      ),
      height: 32,
      width: 125,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: Colors.white),
          const SizedBox(width: 3),
          Text(text,style: const TextStyle(color: Colors.white, fontSize: 13)),
        ],
      ),
    ),
  );
}