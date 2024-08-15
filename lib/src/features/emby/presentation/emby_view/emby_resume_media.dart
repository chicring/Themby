
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:themby/src/features/emby/data/view_repository.dart';
import 'package:themby/src/features/emby/presentation/widgets/list_cards_hh.dart';


class EmbyResumeMedia extends ConsumerWidget{
  const EmbyResumeMedia({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final resumes = ref.watch(getResumeMediaProvider());

    print("resume构建时间${DateTime.now()}");
    
    void openDialog(){
      SmartDialog.showAttach(
          targetContext: context,
          builder:  (_) => Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Theme.of(context).colorScheme.surfaceBright,
            ),
            constraints: const BoxConstraints(
              minWidth: 200,
            ),
            padding: const EdgeInsets.all(10),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("继续观看"),
              ]
            ),
          )
      );
    }
    
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


