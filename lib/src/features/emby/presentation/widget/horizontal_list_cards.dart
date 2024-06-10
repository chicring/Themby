import 'package:flutter/material.dart';
import 'package:themby/src/common/widget/header_text.dart';
import 'package:themby/src/features/emby/domain/media.dart';
import 'package:themby/src/features/emby/presentation/widget/media_card.dart';

class HorizontalListViewMedias extends StatelessWidget{

  const HorizontalListViewMedias({super.key, required this.medias, required this.name, required this.parentId});

  final String name;
  final String parentId;
  final List<Media> medias;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            HeaderText(text: name),

            TextButton(
              onPressed: (){},
              child: const Text('查看更多'),
            ),
          ],
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.2 + 55,
          child: ListView(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            children: [
              ...medias.map((media) => MediaCard(media: media)),
            ],
          ),
        )
      ],
    );
  }
}