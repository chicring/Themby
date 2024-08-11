
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:themby/src/common/constants.dart';
import 'package:themby/src/common/widget/header_text.dart';
import 'package:themby/src/common/widget/network_img_layer.dart';
import 'package:themby/src/features/emby/application/emby_state_service.dart';
import 'package:themby/src/features/emby/data/view_repository.dart';
import 'package:themby/src/features/emby/domain/emby/item.dart';
import 'package:themby/src/features/emby/presentation/widgets/skeleton/list_card_h_h_skeleton.dart';
import 'package:themby/src/helper/screen_helper.dart';

class EmbyView extends ConsumerWidget {
  const EmbyView({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final view = ref.watch(getViewsProvider);

    double cardWidth = ScreenHelper.getPortionAuto(xs: 5, sm: 4, md: 3) * 1.1;
    double cardHeight = cardWidth * 9 / 16;

    return view.when(
      loading: () => ListCardHHSkeleton(width: cardWidth, height: cardHeight),
      error: (error, stack) => const SizedBox(),
      data: (data) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const HeaderText(text: '媒体库'),
            const SizedBox(height: 5),
            SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(width: StyleString.safeSpace),
                    for(int i = 0; i < data.items.length; i++ ) ...[
                      _viewItem(context, data.items[i]),
                      const SizedBox(width: 12),
                    ]
                  ],
                )
            )
          ],
        );
      },
    );
  }
}


Widget _viewItem(BuildContext context,Item view){

  double cardWidth = ScreenHelper.getPortionAuto(xs: 5, sm: 4, md: 3) * 1.1;
  double cardHeight = cardWidth * 9 / 16;

  return InkWell(
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
    onTap: (){
      GoRouter.of(context).push(Uri(path: '/library', queryParameters: {'parentId': view.id,'title': view.name,'filter': ''}).toString());
    },
    child: Column(
      children: [
        Container(
          height: cardHeight,
          width: cardWidth,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10)
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: NetworkImgLayer(
              imageUrl: view.imagesCustom!.primary,
              width: cardWidth,
              height: cardHeight,
            ),
          ),
        ),
        const SizedBox(height: 4),
        SizedBox(
          width: cardWidth,
          child: Text(
            view.name ?? '',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 12,
              letterSpacing: 0.5,
            ),
          ),
        )
      ],
    ),
  );
}

