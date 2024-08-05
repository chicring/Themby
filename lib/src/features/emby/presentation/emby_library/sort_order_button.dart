

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:themby/src/features/emby/presentation/emby_library/emby_library_query_notifier.dart';

class SortOrderButton extends ConsumerWidget{
  const SortOrderButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final state = ref.watch(embyLibraryQueryNotifierProvider);

    // return IconButton(
    //   icon: state.sortOrder == "Descending" ? const Icon(Icons.arrow_downward_rounded) : const Icon(Icons.arrow_upward_rounded),
    //   onPressed: (){
    //     ref.read(embyLibraryQueryNotifierProvider.notifier).toggleSortOrder();
    //   },
    // );

    return TextButton(
      onPressed: () {
        ref.read(embyLibraryQueryNotifierProvider.notifier).toggleSortOrder();
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text("排序", style: TextStyle(fontSize: 14)),
          state.sortOrder == "Descending" ?
          const Icon(Icons.keyboard_arrow_down, size: 14,) :
          const Icon(Icons.keyboard_arrow_up, size: 14,),
        ],
      ),
    );
  }

}