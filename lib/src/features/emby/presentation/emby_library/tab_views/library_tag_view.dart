import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:themby/src/common/widget/empty_data.dart';

class LibraryTagView extends ConsumerWidget{
  const LibraryTagView({super.key, required this.parentId, required this.filter});

  final String parentId;
  final String filter;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const EmptyData(message: "待做");
  }
}