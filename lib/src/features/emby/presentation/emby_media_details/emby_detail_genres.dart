
import 'package:flutter/material.dart';
import 'package:themby/src/common/constants.dart';
import 'package:themby/src/features/emby/domain/emby/genre_item.dart';

class EmbyDetailGenres extends StatelessWidget{
  const EmbyDetailGenres({super.key, required this.items});

  final List<GenreItem> items;

  Widget buildTag(GenreItem genre, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
      decoration: BoxDecoration(
        borderRadius: StyleString.mdRadius,
        color: color.withOpacity(0.3),
      ),
      child: Text(
        genre.name!,
        style: const TextStyle(
            fontSize: 12
          // decoration: TextDecoration.underline,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Color color = Theme.of(context).colorScheme.primaryContainer;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: StyleString.safeSpace),
      child: Wrap(
        spacing: 6,
        runSpacing: 5,
        alignment: WrapAlignment.start,
        children: items.map((genre) => buildTag(genre,color)).toList(),
      ),
    );
  }
}