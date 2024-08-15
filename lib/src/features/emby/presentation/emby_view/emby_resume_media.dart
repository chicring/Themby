
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:themby/src/features/emby/data/favorite_repository.dart';
import 'package:themby/src/features/emby/data/view_repository.dart';
import 'package:themby/src/features/emby/presentation/widgets/list_cards_hh.dart';


class EmbyResumeMedia extends ConsumerWidget{
  const EmbyResumeMedia({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final resumes = ref.watch(getResumeMediaProvider());

    print("resume构建时间${DateTime.now()}");

    List<String> actions = ["remove"];
    
    return resumes.when(
        data: (data) {
          return data.isNotEmpty
              ? ListCardsHh(name: "继续观看", items: data, actions: actions)
              : const SizedBox();
        },
        error: (error, stack) => const SizedBox(),
        loading: () => const SizedBox(),
    );
  }
}


