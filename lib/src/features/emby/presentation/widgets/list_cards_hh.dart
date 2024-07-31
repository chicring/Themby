

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:themby/src/common/constants.dart';
import 'package:themby/src/features/emby/domain/emby/item.dart';
import 'package:themby/src/helper/screen_helper.dart';

import 'media_card_h.dart';

class ListCardsHh extends ConsumerWidget{
  const ListCardsHh({super.key,required this.name,required this.items,this.onSelect});

  final String name;

  final List<Item> items;

  final Function? onSelect;


  @override
  Widget build(BuildContext context, WidgetRef ref) {

    double cardWidth = ScreenHelper.getPortionAuto(xs: 5, sm: 4, md: 3) * 1.3;
    double cardHeight = cardWidth * 9 / 16;

    return Column(
      children: [
        Row(
          children: [
            const SizedBox(width: StyleString.safeSpace),
            Text(name, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          ],
        ),
        const SizedBox(height: StyleString.safeSpace),
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
                        MediaCardH(
                          item: items.first,
                          width: cardWidth,
                          height: cardHeight,
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
                  itemCount: items.length,
                  padding: const EdgeInsets.only(left: StyleString.safeSpace),
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.only(
                        right: StyleString.safeSpace,
                      ),
                      child: MediaCardH(
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

