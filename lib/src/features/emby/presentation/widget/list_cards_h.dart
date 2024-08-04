import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:themby/src/common/constants.dart';
import 'package:themby/src/features/emby/domain/media.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:themby/src/features/emby/presentation/widget/media_card_v.dart';
import 'package:themby/src/helper/screen_helper.dart';

class ListCardsH extends ConsumerWidget{
  const ListCardsH({super.key, required this.name, required this.parentId, required this.medias, this.showMore = true, this.onSelect});

  final String name;
  final String parentId;
  final List<Media> medias;

  final Function? onSelect;
  final bool showMore;


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    double cardWidth = ScreenHelper.getPortionAuto();
    double cardHeight = cardWidth /0.65;

    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
              child: Text(name, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            ),
            Opacity(
              opacity: showMore ? 1.0 : 0.0,
              child: IconButton(
                padding: const EdgeInsets.all(0),
                onPressed: () async{
                  onSelect != null ? onSelect!() :
                  GoRouter.of(context).push(Uri(path: '/library/$parentId', queryParameters: {'title': name}).toString());
                },
                icon: const Icon(Icons.arrow_forward_ios_rounded,size: 13),
                // child: const Text('查看更多'),
              )
            ),
          ],
        ),
        const SizedBox(height: 5),
        Stack(
          children: [
            IgnorePointer(
              child: Opacity(
                opacity: 0.0,
                child: Container(
                    width: cardWidth,
                    margin: const EdgeInsets.only(
                      left: StyleString.safeSpace,
                    ),
                    child: Column(
                      children: [
                        MediaCardV(
                          media: medias.first,
                        ),
                        const SizedBox(height: 2),
                      ],
                    )
                ),
              ),
            ),
            const SizedBox(width: double.infinity),
            Positioned.fill(
                child: ListView.builder(
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
                )
            )
          ],
        ),
        // SizedBox(
        //   height: cardHeight + 55,
        //   child: medias.isEmpty ?
        //     const Center(child: Text('暂无数据')) :
        //     ,
        // )
      ],
    );
  }
}