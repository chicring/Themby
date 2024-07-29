import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:themby/src/common/constants.dart';
import 'package:themby/src/features/emby/domain/emby/item.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:themby/src/helper/screen_helper.dart';

import 'season_card_v.dart';



class ListSeasonCardH extends ConsumerWidget{
  const ListSeasonCardH({super.key, required this.name, required this.items,});

  final String name;
  final List<Item> items;


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
                      child: SeasonCardV(
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
                      child: SeasonCardV(
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