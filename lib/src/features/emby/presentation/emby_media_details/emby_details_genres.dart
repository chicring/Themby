

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:themby/src/common/constants.dart';

class EmbyDetailsGenres extends ConsumerWidget{
  const EmbyDetailsGenres({super.key, required this.genres});

  final List<String> genres;

  Widget buildTag(String genre, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
      decoration: BoxDecoration(
        borderRadius: StyleString.mdRadius,
        color: color.withOpacity(0.3),
      ),
      child: Text(
        genre,
        style: const TextStyle(
            fontSize: 13
          // decoration: TextDecoration.underline,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    Color color = Theme.of(context).colorScheme.primaryContainer;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: StyleString.safeSpace),
      child: Wrap(
        spacing: 6,
        runSpacing: 5,
        alignment: WrapAlignment.start,
        children: genres.map((genre) => buildTag(genre,color)).toList(),
      ),
    );
  }

}