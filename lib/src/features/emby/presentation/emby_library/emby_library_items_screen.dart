

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class EmbyLibraryItemsScreen extends ConsumerWidget{
  const EmbyLibraryItemsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {


    return CustomScrollView(
      slivers: [
        // SliverPersistentHeader(
        //   delegate: ,
        //   pinned: true,
        // ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              return ListTile(
                title: Text('Item $index'),
              );
            },
            childCount: 100,
          ),
        ),
      ],
    );
  }

}