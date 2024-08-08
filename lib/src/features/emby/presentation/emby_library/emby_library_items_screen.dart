

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class EmbyLibraryItemsScreen extends ConsumerWidget{
  const EmbyLibraryItemsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {


    return Container(
      child: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index){
          return Container(
            height: 100,
            color: Colors.red,
            margin: const EdgeInsets.all(8),
          );
        },
      ),
    );
  }

}