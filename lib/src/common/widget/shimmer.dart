import 'package:flutter/material.dart';

import 'placeholders.dart';

class ShimmerList extends StatelessWidget{
  const ShimmerList({super.key, required this.height, required this.width});

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
   return Column(
     crossAxisAlignment: CrossAxisAlignment.start,
     mainAxisAlignment: MainAxisAlignment.start,
     children: [
       const TitlePlaceholder(width: 50),
       const SizedBox(height: 5),
       SizedBox(
         height: height + 55,
         child: ListView.builder(
           scrollDirection: Axis.horizontal,
           itemCount: 10,
           itemBuilder: (context, index) {
             return CardPlaceholder(height: height, width: width,);
           },
         ),
       ),
     ],
   );
  }
}

// class ShimmerGrid extends StatelessWidget{
//   const ShimmerGrid({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//
//   }
//
// }
