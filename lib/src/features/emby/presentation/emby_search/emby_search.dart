import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class EmbySearch extends ConsumerWidget{
  const EmbySearch({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(15.0), // Add your desired padding here
      child: TextField(
        maxLines: 1,
        decoration: InputDecoration(
          filled: true, // Set filled to true
          fillColor: Theme.of(context).appBarTheme.backgroundColor, // Set the fill color to your desired color
          hintText: 'Search',
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            borderSide: BorderSide.none,
          ),
          prefixIcon: Icon(Icons.search),
        ),
      ),
    );
  }
}