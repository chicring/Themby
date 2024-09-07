
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class FvpItem extends StatefulWidget{
  const FvpItem({super.key});

  @override
  State<StatefulWidget> createState() => _FvpItemState();
}

class _FvpItemState extends State<FvpItem>{

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (bool didPop) {
        if (didPop) {
          return;
        }
        // onBackPressed(context);
      },
      child: Container(
        color: Colors.black,
        child: MouseRegion(
          onHover: (event) {
            // showControls();
          },
          child: GestureDetector(
            onTap: () {
              // toggleControls();
            },
            child: KeyboardListener(
              autofocus: true,
              onKeyEvent: (KeyEvent event) {
                // handleKeyEvent(event);
              },
              focusNode: null,
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    /// 视频播放器
                    Center(child: playerSurface),
                    /// 加载动画
                  ],
                ),
              ),
            )
          ),
        ),
      ),
    );
  }

  Widget get playerSurface {
    return AspectRatio(
        aspectRatio: playerController.mediaPlayer.value.aspectRatio,
        child: VideoPlayer(
          playerController.mediaPlayer,
        )
    );
  }
}
