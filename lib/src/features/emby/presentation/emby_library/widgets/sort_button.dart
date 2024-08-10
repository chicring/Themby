

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:themby/src/features/emby/domain/query/sort_type.dart';
import 'package:themby/src/helper/prefs_provider.dart';

import '../emby_library_query_notifier.dart';

class SortButton extends ConsumerStatefulWidget{
  const SortButton({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SortButtonState();

}

class _SortButtonState extends ConsumerState<SortButton>{

  int sortIndex = 11;

  @override
  void initState() {
    super.initState();
    sortIndex = ref.read(sharedPreferencesProvider).getInt("sortType") ?? 11;
  }

  @override
  Widget build(BuildContext context) {

    final state = ref.watch(embyLibraryQueryNotifierProvider);

    return PopupMenuButton<int>(
      elevation: 1,
      padding: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      position: PopupMenuPosition.under,
      constraints: const BoxConstraints.tightFor(height: 400),
      onSelected: (int index) {
        setState(() {
          sortIndex = index;
          print("sortIndex: $sortIndex");
        });
        ref.read(embyLibraryQueryNotifierProvider.notifier).setSortBy(index);
      },
      // icon: const Icon(Icons.sort),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Icon(Icons.sort, size: 18),
          const SizedBox(width: 4),
          Text(sortType[sortIndex]["title"]!, style: const TextStyle(fontSize: 14)),
          const SizedBox(width: 4),
          state.sortOrder == "Descending" ?
          const Icon(Icons.keyboard_arrow_down, size: 18) :
          const Icon(Icons.keyboard_arrow_up, size: 18),
        ],
      ),
      itemBuilder: (BuildContext context) => buildSortItems(context,state.sortOrder),
    );
  }

  List<PopupMenuEntry<int>> buildSortItems(BuildContext context,String sortOrder) {
    return <PopupMenuEntry<int>>[
      for (int i = 0; i < sortType.length; i++) ...[
        PopupMenuItem<int>(
          value: i,
          padding: const EdgeInsets.symmetric(horizontal: 12), // 调整间距
          child: SizedBox(
            width: 120,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                i == sortIndex ? const Icon(Icons.check,size: 16) : const SizedBox(width: 4),

                const SizedBox(width: 8), // 调整图标和文本之间的间距
                Text(sortType[i]["title"]!, style: const TextStyle(fontSize: 14)),

                if (i == sortIndex) ...[
                  const SizedBox(width: 5),
                  sortOrder == "Ascending" ?
                  const Icon(Icons.keyboard_arrow_up, size: 17) :
                  const Icon(Icons.keyboard_arrow_down, size: 17),
                ],
              ],
            ),
          ),
        ),
      ]
    ];
  }
}

