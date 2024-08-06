import 'package:flutter/material.dart';


class LoadingScreen extends StatelessWidget{
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}