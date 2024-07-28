
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shimmer/shimmer.dart';
import 'package:themby/src/common/constants.dart';
import 'package:themby/src/common/widget/header_text.dart';
import 'package:themby/src/common/widget/shimmer.dart';
import 'package:themby/src/features/emby/application/emby_state_service.dart';
import 'package:themby/src/features/emby/data/image_repository.dart';
import 'package:themby/src/features/emby/data/view_repository.dart';
import 'package:themby/src/features/emby/domain/image_props.dart';
import 'package:themby/src/features/emby/domain/media.dart';
import 'package:themby/src/features/emby/presentation/widget/media_card_h.dart';
import 'package:themby/src/helper/screen_helper.dart';

class EmbyResumeMedia extends ConsumerWidget{
  const EmbyResumeMedia({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final resumes = ref.watch(getResumeMediaProvider());

    double cardWidth = ScreenHelper.getPortionAuto(xs: 5, sm: 4, md: 3) * 1.3;
    double cardHeight = cardWidth * 9 / 16;

    return resumes.when(
        data: (data) {
          return data.isNotEmpty
              ?
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(width: StyleString.safeSpace),
              const Row(
                children: [
                  HeaderText(text: '继续观看'),
                ],
              ),
              const SizedBox(height: 10),
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
                                media: data.first,
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
                        itemCount: data.length,
                        padding: const EdgeInsets.only(left: StyleString.safeSpace),
                        itemBuilder: (context, index) {
                          return Container(
                            width: cardWidth,
                            height: cardHeight,
                            margin: const EdgeInsets.only(
                              right: StyleString.safeSpace,
                            ),
                            child: MediaCardH(
                              media: data[index],
                            ),
                          );
                        },
                      )
                  )
                ],
              ),
            ],
          )
              : const SizedBox();
        },
        error: (error, stack) => const SizedBox(),
        loading: () => const SizedBox(),
    );
  }
}


