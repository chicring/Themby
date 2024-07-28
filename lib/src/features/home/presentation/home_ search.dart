

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:themby/src/features/home/presentation/home_search_query_notifier.dart';
import 'package:themby/src/localization/string_hardcoded.dart';

import 'home_server_notifier.dart';

class HomeSearch extends ConsumerStatefulWidget {
  const HomeSearch({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeSearchState();
}

class _HomeSearchState extends ConsumerState<HomeSearch> {

  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: TextField(
        controller: _controller,
        maxLines: 1,
        decoration: InputDecoration(
          hintText: '搜索'.hardcoded,
          prefixIcon: const Icon(Icons.search),
          filled: true, // Set filled to true
          fillColor: Theme.of(context).colorScheme.surfaceContainer,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide.none,
          ),
        ),
        onEditingComplete: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        onChanged: (text) => ref
            .read(homeSearchQueryNotifierProvider.notifier)
            .setQuery(text),
      ),
    );
  }
}