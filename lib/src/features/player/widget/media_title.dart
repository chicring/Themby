// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:themby/src/features/emby/application/emby_state_service.dart';
// import 'package:themby/src/features/emby/data/image_repository.dart';
// import 'package:themby/src/features/emby/data/view_repository.dart';
// import 'package:themby/src/features/emby/domain/image_props.dart';
//
// class MediaTitle extends ConsumerWidget{
//   const MediaTitle({super.key,required this.id});
//   final String id;
//
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//
//     final double height = MediaQuery.sizeOf(context).height;
//
//     final double width = MediaQuery.sizeOf(context).width;
//
//
//     final site = ref.watch(embyStateServiceProvider.select((value) => value.site));
//     final data = ref.read(GetMediaProvider(id));
//
//
//     return data.when(
//       loading: () => const CircularProgressIndicator(),
//       error: (error,_) => Text(error.toString()),
//       data: (data) => Container(
//         constraints:  BoxConstraints(
//           minHeight: height * 0.08,
//           maxHeight: height * 0.1,
//           maxWidth: width * 0.2,
//         ),
//         child: CachedNetworkImage(
//           imageUrl: getImageUrl(
//               site!,
//               id,
//               ImageProps(
//                 tag: data.imageTags.logo,
//                 type: ImageType.logo,
//               )
//           ),
//           errorWidget: (_,__,___) => const SizedBox(),
//         ),
//       ),
//     );
//   }
// }