

import 'dart:ui';

import 'package:flutter/material.dart';

class CustomToastWidget extends StatelessWidget {
  final String message;

  const CustomToastWidget({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 120),
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
            decoration: BoxDecoration(
              color: Colors.grey.shade200.withOpacity(0.7),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              message,
            ),
          ),
        ),
      ),
    );
  }
}