
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:themby/src/features/fvp/service/fvp_controller.dart';
import 'package:themby/src/features/player/utils/fullscreen.dart';

class FvpScreen extends ConsumerStatefulWidget{
  const FvpScreen({super.key});

  @override
  ConsumerState<FvpScreen> createState() => _FvpScreen();
}

class _FvpScreen extends ConsumerState<FvpScreen> {

  @override
  void initState() {
    super.initState();
    enterFullScreen();
    ref.read(fvpControllerProvider.notifier).play("http://c.hjong.cn:8096/emby/videos/5128/stream.mp4?DeviceId=8a3897ed-e92d-4fdf-a8e4-f6bbf9581172&MediaSourceId=0118f2dae3742d1cc3470d5fba7ffb53&Static=true&PlaySessionId=97a4f3cb77f347dfa1649b71f70951d7&api_key=3543332c1b5645a2b44d6434395ebd0f");
  }

  @override
  void deactivate() {
    exitFull();
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {

    final state = ref.watch(fvpControllerProvider);
    return Stack(
      children: [
        if(state.textureId != null) AspectRatio(
          aspectRatio: 16/9,
          child: Texture(
            textureId: state.textureId!,
            filterQuality: FilterQuality.none,
          ),
        )
      ],
    );
  }
}
