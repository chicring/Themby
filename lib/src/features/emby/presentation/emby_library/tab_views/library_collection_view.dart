import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LibraryCollectionView extends ConsumerWidget{
  const LibraryCollectionView({super.key, required this.parentId, required this.filter});

  final String parentId;
  final String filter;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container();
  }
}