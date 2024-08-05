

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:themby/src/features/emby/domain/query/sort_type.dart';

import 'emby_library_query_notifier.dart';

class SortButton extends ConsumerStatefulWidget{
  const SortButton({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SortButtonState();

}

class _SortButtonState extends ConsumerState<SortButton>{

  int sortIndex = 0;


  @override
  Widget build(BuildContext context) {
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
        });
        ref.read(embyLibraryQueryNotifierProvider.notifier).setSortBy(index);
      },
      icon: const Icon(Icons.sort),
      itemBuilder: (BuildContext context) => buildSortItems(context),
    );
  }

  List<PopupMenuEntry<int>> buildSortItems(BuildContext context) {
    return <PopupMenuEntry<int>>[
      for (int i = 0; i < sortType.length; i++) ...[
        PopupMenuItem<int>(
          value: i,
          padding: const EdgeInsets.symmetric(horizontal: 10), // 调整间距
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                i == sortIndex ? Icons.check_box : Icons.check_box_outline_blank,
                size: 16,
              ),
              const SizedBox(width: 8), // 调整图标和文本之间的间距
              Text(sortType[i]["title"]!, style: const TextStyle(fontSize: 14)),
            ],
          ),
        ),
        const PopupMenuDivider(height: 1),
      ]
    ];
  }
}

