
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
import 'package:themby/src/features/emby/presentation/widgets/list_cards_hh.dart';
import 'package:themby/src/helper/screen_helper.dart';

class EmbyResumeMedia extends ConsumerWidget{
  const EmbyResumeMedia({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final resumes = ref.watch(getResumeMediaProvider());

    return resumes.when(
        data: (data) {
          return data.isNotEmpty
              ? ListCardsHh(name: "继续观看", items: data)
              : const SizedBox();
        },
        error: (error, stack) => const SizedBox(),
        loading: () => const SizedBox(),
    );
  }
}


