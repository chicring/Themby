
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:themby/src/common/constants.dart';

import 'emby_search_item.dart';
import 'emby_search_query_notifier.dart';
import 'emby_search_suggests.dart';

class EmbySearchScreen extends ConsumerStatefulWidget {
  const EmbySearchScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _EmbySearchScreenState();
}

class _EmbySearchScreenState extends ConsumerState<EmbySearchScreen>  {

  final _controller = TextEditingController();


  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    final String query = ref.watch(embySearchQueryNotifierProvider);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        shape: Border(
          bottom: BorderSide(
            color: Theme.of(context).dividerColor.withOpacity(0.3),
            width: 1,
          ),
        ),
        titleSpacing: 0,
        actions: [
          IconButton(
              icon: const Icon(Icons.search,size: 22),
              onPressed: () {

              }
          ),
          const SizedBox(width: 10)
        ],
        title: TextField(
          autofocus: true,
          controller: _controller,
          textInputAction: TextInputAction.search,
          decoration: InputDecoration(
            hintText: '搜索电影和剧集',
            border: InputBorder.none,
            suffixIcon: IconButton(
              icon: Icon(
                Icons.clear,
                size: 22,
                color: Theme.of(context).colorScheme.outline,
              ),
              onPressed: () {
                ref.read(embySearchQueryNotifierProvider.notifier)
                    .setQuery('');
                _controller.clear();
              },
            ),
          ),
          onEditingComplete: () {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          onChanged: (value) {
            ref.read(embySearchQueryNotifierProvider.notifier)
                .setQuery(value);
          },
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(12),
        child: query.isNotEmpty
            ? const EmbySearchItem()
            : const EmbySearchSuggests(),
      ),
    );
  }
}



Widget _searchHistory() {
  return const SizedBox();
}