import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:themby/common/models/emby_view.dart';
import '../../view_model.dart';

class EmbyListView extends ConsumerWidget{
   const EmbyListView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<EmbyView>? views = ref.watch(embyVMProvider.select((value) => value.views));

    return views == null ?
      const Center(
          child: CircularProgressIndicator()
      ) : ListView.builder(
      itemCount: views.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(views[index].name!),
        );
      },
    );
  }

}