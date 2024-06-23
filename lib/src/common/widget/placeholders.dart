import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:themby/src/common/constants.dart';

class BannerPlaceholder extends StatelessWidget {
  const BannerPlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 200.0,
      margin: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        color: Colors.white,
      ),
    );
  }
}

class TitlePlaceholder extends StatelessWidget {
  final double width;

  const TitlePlaceholder({
    super.key,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {

    return Shimmer.fromColors(
      baseColor: Colors.black26,
      highlightColor: Colors.black12,
      enabled: true,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: StyleString.lgRadius,
            color: Colors.white,
          ),
          width: width,
          height: 12.0,
        ),
      ),
    );
  }
}

enum ContentLineType {
  twoLines,
  threeLines,
}

class ContentPlaceholder extends StatelessWidget {
  final ContentLineType lineType;

  const ContentPlaceholder({
    super.key,
    required this.lineType,
  });

  @override
  Widget build(BuildContext context) {

    return Shimmer.fromColors(
      baseColor: Colors.black26,
      highlightColor: Colors.black12,
      enabled: true,
      child:  Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 96.0,
              height: 72.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                color: Colors.black,
              ),
            ),
            const SizedBox(width: 12.0),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: double.infinity,
                    height: 10.0,
                    color: Colors.black,
                    margin: const EdgeInsets.only(bottom: 8.0),
                  ),
                  if (lineType == ContentLineType.threeLines)
                    Container(
                      width: double.infinity,
                      height: 10.0,
                      color: Colors.black,
                      margin: const EdgeInsets.only(bottom: 8.0),
                    ),
                  Container(
                    width: 100.0,
                    height: 10.0,
                    color: Colors.black,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}


class CardPlaceholder extends StatelessWidget{

  const CardPlaceholder({super.key, required this.height, required this.width});

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {

    return Shimmer.fromColors(
        baseColor: Colors.black26,
        highlightColor: Colors.black12,
        enabled: true,
        child: SizedBox(
          height: height + 55,
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(
                  left: StyleString.safeSpace,
                ),
                decoration: BoxDecoration(
                  borderRadius: StyleString.lgRadius,
                  color: Colors.black,
                ),
                height: height,
                width: width,
              ),
              const SizedBox(height: 5),
              Container(
                decoration: BoxDecoration(
                  borderRadius: StyleString.lgRadius,
                  color: Colors.black,
                ),
                width: width * 0.6,
                height: 8.0,
              ),
            ],
          ),
        ),
    );
  }

}