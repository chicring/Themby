
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class EmptyData extends StatelessWidget {
  const EmptyData({super.key, this.message});
  final String? message;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            "assets/empty-data.svg",
            height: 200,
          ),
          const SizedBox(height: 20),
          Text(
            message ?? "",
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ],
      ),
    );
  }
}