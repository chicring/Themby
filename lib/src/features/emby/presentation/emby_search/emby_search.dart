import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:themby/src/features/emby/application/emby_state_service.dart';
import 'package:themby/src/features/emby/data/image_repository.dart';

class EmbySearch extends ConsumerWidget{
  const EmbySearch({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return Padding(
      padding: const EdgeInsets.only(top: 8,bottom: 8), // Add your desired padding here
      child: TextField(
        maxLines: 1,
        decoration: InputDecoration(
          filled: true, // Set filled to true
          fillColor: Theme.of(context).appBarTheme.backgroundColor, // Set the fill color to your desired color
          hintText: 'Search',
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(30)),
            borderSide: BorderSide.none,
          ),
          prefixIcon: const Icon(Icons.search),
        ),
      ),
    );
  }
}