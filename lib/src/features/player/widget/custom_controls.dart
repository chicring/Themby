import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:media_kit_video/media_kit_video.dart';

class CustomControls extends ConsumerStatefulWidget {
  const CustomControls({super.key,required this.state});
  final VideoState state;
  @override
  ConsumerState<CustomControls> createState() => _CustomControls();
}

class _CustomControls extends ConsumerState<CustomControls> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        AnimatedOpacity(
            curve: Curves.easeInOut,
            duration: const Duration(seconds: 1),
            opacity:  1,
        )
      ],
    );
  }
}