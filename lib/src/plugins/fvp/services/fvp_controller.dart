// import 'package:logger/logger.dart';
// import 'package:riverpod_annotation/riverpod_annotation.dart';
// import 'package:themby/src/helper/logger.dart';
// import 'package:video_player/video_player.dart';
//
// part 'fvp_controller.g.dart';
//
// class FvpController{
//
//   late VideoPlayerController videoPlayerController;
//
//   // 音量
//   double volume = 0;
//   // 亮度
//   double brightness = 0;
//   // 播放速度
//   double playerSpeed = 1.0;
//
//   VideoPlayerController get player => videoPlayerController;
//
//   Future<void> openMedia(String url,{Duration position = Duration.zero}) async{
//
//   }
//
//   Future<VideoPlayerController> createVideoController(String videoUrl) async {
//     String userAgent = "Themby/1.0.4";
//     var httpHeaders = {
//       'user-agent': userAgent,
//     };
//     videoPlayerController = VideoPlayerController.networkUrl(Uri.parse(videoUrl),
//         httpHeaders: httpHeaders);
//     await videoPlayerController.initialize();
//     return videoPlayerController;
//   }
//
//   Future playOrPause() async {
//     if (videoPlayerController.value.isPlaying) {
//       await pause();
//     } else {
//       await play();
//     }
//   }
//
//   Future seek(Duration duration) async {
//     await videoPlayerController.seekTo(duration);
//   }
//
//   Future pause() async {
//     await videoPlayerController.pause();
//   }
//
//   Future play() async {
//     await videoPlayerController.play();
//   }
//
//   Future setPlaybackSpeed(double playerSpeed) async {
//     this.playerSpeed = playerSpeed;
//     try {
//       videoPlayerController.setPlaybackSpeed(playerSpeed);
//     } catch (e) {
//       ThembyLogger().log(Level.warning, '设置播放速度失败 ${e.toString()}');
//     }
//   }
//
//
//   Future changeVideoStack() async{
//   }
// }
//
//
// @riverpod
// FvpController fvpController(FvpControllerRef ref) => FvpController();
//
//
//
//
