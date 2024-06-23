import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:media_kit/media_kit.dart'; // Provides [Player], [Media], [Playlist] etc.
import 'package:media_kit_video/media_kit_video.dart';
import 'package:themby/src/features/player/presentation/player_notifier.dart';

class HorizontalPlayer extends ConsumerStatefulWidget {
  const HorizontalPlayer({super.key});

  @override
  ConsumerState<HorizontalPlayer> createState() => _HorizontalPlayer();
}

class _HorizontalPlayer extends ConsumerState<HorizontalPlayer> {
  late final player = Player();
  late final controller = VideoController(player);


  @override
  void initState() {
    super.initState();
  }


  @override
  void dispose() {
    player.stop();
    player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    final url = ref.watch(playerNotifierProvider);
    print('即将播放: $url');
    player.open(
        Media(url)
    );
    player.play();
    player.stream.error.listen((error) {
      print('Error: $error');
    });

    return Center(
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.width * 9.0 / 16.0,
        // Use [Video] widget to display video output.
        child: Video(controller: controller),
      ),
    );
  }
}