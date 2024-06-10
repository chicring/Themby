import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class LoadingCard extends StatelessWidget{
  const LoadingCard({super.key});

  @override
  Widget build(BuildContext context) {

    return SizedBox(
      height: 180,
      child: Shimmer.fromColors(
        baseColor: Colors.black26,
        highlightColor: Colors.black12,
        child: Container(
          color: Colors.black,
          height: 180,
          width: 108,
        ),
      ),
    );
  }
}

class LoadingCardList extends StatelessWidget{
  const LoadingCardList({super.key});

  @override
  Widget build(BuildContext context) {

    return SizedBox(
      height: 200,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) {
          return const Padding(
            padding: EdgeInsets.all(8.0),
            child: LoadingCard(),
          );
        },
      ),
    );
  }
}