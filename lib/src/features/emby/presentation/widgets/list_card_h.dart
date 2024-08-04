import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:themby/src/common/constants.dart';
import 'package:themby/src/features/emby/domain/emby/item.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:themby/src/helper/screen_helper.dart';

import 'media_card_v.dart';

class ListCardsH extends ConsumerWidget{
  const ListCardsH({super.key, required this.name, required this.parentId, required this.items, this.showMore = true, this.onSelect});

  final String name;
  final String parentId;
  final List<Item> items;

  final Function? onSelect;
  final bool showMore;


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    double cardWidth = ScreenHelper.getPortionAuto();
    double cardHeight = cardWidth / 0.65;

    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 0, 0, 0),
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
                child: Column(
                  children: [
                    Container(
                      width: cardWidth,
                      margin: const EdgeInsets.only(
                        left: StyleString.safeSpace,
                      ),
                      child: MediaCardV(
                        item: items.first,
                        width: cardWidth,
                        height: cardHeight,
                      ),
                    ),
                    const SizedBox(height: 2),
                  ],
                ),
              ),
            ),
            const SizedBox(width: double.infinity),
            Positioned.fill(
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: items.length,
                  padding: const EdgeInsets.only(right: StyleString.safeSpace),
                  itemBuilder: (context, index) {
                    return Container(
                      padding: const EdgeInsets.only(left: StyleString.safeSpace),
                      child: MediaCardV(
                        item: items[index],
                        width: cardWidth,
                        height: cardHeight,
                      ),
                    );
                  },
                )
            )
          ],
        ),
      ],
    );
  }
}