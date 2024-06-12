import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:themby/src/common/widget/header_text.dart';
import 'package:themby/src/features/emby/domain/media.dart';
import 'package:themby/src/features/emby/presentation/widget/media_card.dart';

class HorizontalListViewMedias extends ConsumerWidget{

  const HorizontalListViewMedias({super.key, required this.medias, required this.name, required this.parentId});

  final String name;
  final String parentId;
  final List<Media> medias;

  @override
  Widget build(BuildContext context,WidgetRef ref) {

    final double height = MediaQuery.of(context).size.width < 650 ? 235 : 325;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            HeaderText(text: name),

            TextButton(
              onPressed: () async{
                // await ref.read(embyLibraryNotifierProvider.notifier).setParentId(parentId);
                // GoRouter.of(context).push('/library/$parentId');
              },
              child: const Text('查看更多'),
            ),
          ],
        ),
        SizedBox(
          height: height,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: medias.length,
            itemBuilder: (context, index) {
              return MediaCard(media: medias[index]);
            },
          ),
        )
      ],
    );
  }
}