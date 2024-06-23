
import 'package:flutter/material.dart';
import 'package:themby/src/common/widget/placeholders.dart';
import 'package:themby/src/common/widget/shimmer.dart';

class EmbyMediaDetailsShimmer extends StatelessWidget{
  const EmbyMediaDetailsShimmer({super.key});

  @override
  Widget build(BuildContext context) {

    final double height = MediaQuery.sizeOf(context).height;
    final double width = MediaQuery.sizeOf(context).width;

    final cardHeight = height * 0.18;
    final cardWidth = height * 0.117;

    return Scaffold(
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            //
            // CardPlaceholder(height: width * 0.65, width: width),

            const SizedBox(height: 10),
            const ContentPlaceholder(lineType: ContentLineType.twoLines),

            const SizedBox(height: 10),
            const ContentPlaceholder(lineType: ContentLineType.threeLines),

            const SizedBox(height: 10),
            ShimmerList(height: cardHeight, width: cardWidth),

            const SizedBox(height: 10),
            ShimmerList(height: cardHeight, width: cardWidth),

          ],
        ),
      ),
    );
  }
}