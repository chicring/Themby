import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:themby/src/features/emby/domain/selected_media.dart';
import 'package:themby/src/features/fvp/presentation/fvp_screen.dart';
import 'package:themby/src/features/player/presentation/video_custom.dart';



class PlayerScreen extends ConsumerWidget {

  const PlayerScreen({super.key, required this.media});

  final SelectedMedia media;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const FvpScreen();
    // return VideoCustom(media: media);
  }
}
