import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:themby/src/common/constants.dart';
import 'package:themby/src/common/widget/header_text.dart';
import 'package:themby/src/features/emby/domain/media.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:themby/src/features/emby/presentation/widget/media_card_v.dart';
import 'package:themby/src/helper/screen_helper.dart';

class ListCardsH extends ConsumerWidget{
  const ListCardsH({super.key, required this.name, required this.parentId, required this.medias, this.showMore = true});

  final String name;
  final String parentId;
  final List<Media> medias;

  final bool showMore;


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    double cardWidth = ScreenHelper.getPortionAuto();
    double cardHeight = cardWidth /0.65;

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            HeaderText(text: name),

            Visibility(
              visible: showMore,
              child: TextButton(
                onPressed: () async{
                  GoRouter.of(context).push(Uri(path: '/library/$parentId', queryParameters: {'title': name}).toString());
                },
                child: const Text('查看更多'),
              )
            ),
          ],
        ),
        SizedBox(
          height: cardHeight + 55,
          child: medias.isEmpty ?
            const Center(child: Text('暂无数据')) :
            ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: medias.length,
                padding: const EdgeInsets.only(left: StyleString.safeSpace),
                itemBuilder: (context, index) {
                  return Container(
                    width: cardWidth,
                    height: cardHeight,
                    margin: const EdgeInsets.only(
                      right: StyleString.safeSpace,
                    ),
                    child: MediaCardV(
                      media: medias[index],
                    ),
                  );
                },
            ),
        )
      ],
    );
  }
}