

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:themby/src/features/emby/application/emby_state_service.dart';
import 'package:themby/src/features/emby/data/view_repository.dart';

class EmbyView extends ConsumerWidget {
  const EmbyView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final site = ref.watch(embyStateServiceProvider.select((value) => value.site));
    final view = ref.watch(getViewsProvider);

    return ListView.builder(
      itemCount: view.valueOrNull?.totalRecordCount ?? 0,
      itemBuilder: (context, index) {
        return view.when(
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (error, stack) => const Center(child: Text('Error')),
          data: (data) {
            return ListTile(
              title: Text(data.items[index].sortName),
            );
          },
        );
      },
    );
  }
}