

import 'package:flutter/material.dart';
import 'package:themby/src/common/widget/shimmer.dart';

class EmbyViewShimmer extends StatelessWidget {
  const EmbyViewShimmer({super.key});

  @override
  Widget build(BuildContext context) {

    final double height = MediaQuery.sizeOf(context).height;


    final cardHeight = height * 0.18;
    final cardWidth = height * 0.117;

    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,

        children: [
          const SizedBox(height: 12),
          ShimmerList(height: height * 0.125, width: height * 0.25),

          const SizedBox(height: 12),
          ShimmerList(height: height * 0.15, width: height * 0.3),


          ShimmerList(height: cardHeight, width: cardWidth),

          ShimmerList(height: cardHeight, width: cardWidth),

          ShimmerList(height: cardHeight, width: cardWidth),
        ],
      ),
    );
  }
}