

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LibraryFilterBar extends ConsumerWidget{
  const LibraryFilterBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      height: 50,
      color: Colors.red,
    );
  }
}