
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';


class MediaCardVSkeleton extends StatelessWidget {

  const MediaCardVSkeleton({
    super.key,
    required this.width,
    required this.height,
  });

  final double width;

  final double height;


  @override
  Widget build(BuildContext context) {

    Color inverseSurface = Theme.of(context).colorScheme.inverseSurface;
    Color onInverseSurface = Theme.of(context).colorScheme.onInverseSurface;

    return Shimmer.fromColors(
      baseColor: inverseSurface,
      highlightColor: onInverseSurface,
      child: Column(
        children: [
          Container(
            width: width,
            height: height,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: inverseSurface,
            ),
          ),
          const SizedBox(height: 4),
          Container(
            width: width * 0.8,
            height: 14,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: inverseSurface,
            ),
          ),
          const SizedBox(height: 4),
          Container(
            width: width * 0.4,
            height: 10,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: inverseSurface,
            ),
          ),
        ],
      ),
    );
  }
}
