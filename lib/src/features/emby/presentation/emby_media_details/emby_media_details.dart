

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class EmbyMediaDetails extends ConsumerWidget {
  final String id;
  const EmbyMediaDetails({super.key,required this.id});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(

        title: Text('EmbyMediaDetails $id'),
      ),
      body: Center(
        child: Text('EmbyMediaDetails $id'),
      ),
    );
  }
}