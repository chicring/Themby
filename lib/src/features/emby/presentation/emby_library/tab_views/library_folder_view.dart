import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LibraryFolderView extends ConsumerWidget{
  const LibraryFolderView({super.key, required this.parentId, required this.filter});

  final String parentId;
  final String filter;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container();
  }
}