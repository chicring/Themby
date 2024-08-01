// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
// import 'package:themby/src/features/emby/domain/episode.dart';
// import 'package:themby/src/features/emby/presentation/widget/episode_card.dart';
// import 'package:themby/src/features/player/service/controls_service.dart';
// import 'package:themby/src/features/player/service/medias_service.dart';
//
//
// Widget episodeSheet(List<Episode> episodes){
//   return Consumer(
//     builder: (context, ref, child) {
//       return Container(
//         width: 300,
//         color: Colors.black.withOpacity(0.85),
//         padding: const EdgeInsets.all(10),
//         child: episodes.isEmpty ?
//         const Center(child: Text('没有可选择的剧集',style: TextStyle(color: Colors.white)))
//         : ListView.builder(
//           itemCount: episodes.length,
//           itemBuilder: (context, index) {
//             return SizedBox(
//               width: 160,
//               height: 90,
//               child: EpisodeCard(
//                 episode: episodes[index],
//                 onPress: (){
//                   ref.read(controlsServiceProvider.notifier).togglePlayMedia(episodes[index].id);
//                 },
//               ),
//             );
//           },
//         )
//       );
//     },
//   );
// }
//
