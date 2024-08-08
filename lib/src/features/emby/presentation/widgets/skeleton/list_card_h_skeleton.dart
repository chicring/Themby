
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:themby/src/common/constants.dart';
import 'package:themby/src/features/emby/domain/emby/item.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:themby/src/helper/screen_helper.dart';

import 'media_card_v_skeleton.dart';



class ListCardsHSkeleton extends StatelessWidget{
  const ListCardsHSkeleton({super.key});



  @override
  Widget build(BuildContext context) {
    double cardWidth = ScreenHelper.getPortionAuto();
    double cardHeight = cardWidth / 0.65;

    Color inverseSurface = Theme.of(context).colorScheme.inverseSurface;
    Color onInverseSurface = Theme.of(context).colorScheme.onInverseSurface;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: cardWidth * 0.7,
          height: 14,
          margin: const EdgeInsets.only(left: StyleString.safeSpace, top: 12),
          padding: const EdgeInsets.fromLTRB(12, 0, 0, 0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: inverseSurface,
          ),
        ),
        const SizedBox(height: 5),
        SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: List.generate( 5, (index){
                  return Padding(
                    padding: const EdgeInsets.only(left: StyleString.safeSpace),
                    child:  MediaCardVSkeleton(width: cardWidth, height: cardHeight),
                  );
                }
              ),
            )
        ),
        const SizedBox(height: 5),
      ],
    );
  }
}