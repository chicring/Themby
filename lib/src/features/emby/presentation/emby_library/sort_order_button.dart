

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:themby/src/features/emby/presentation/emby_library/emby_library_query_notifier.dart';

class SortOrderButton extends ConsumerWidget{
  const SortOrderButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final state = ref.watch(embyLibraryQueryNotifierProvider);

    return IconButton(
      icon: state.sortOrder == "Descending" ? const Icon(Icons.arrow_downward_rounded) : const Icon(Icons.arrow_upward_rounded),
      onPressed: (){
        ref.read(embyLibraryQueryNotifierProvider.notifier).toggleSortOrder();
      },
    );
  }

}