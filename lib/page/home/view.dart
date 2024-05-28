import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:themby/page/home/view_model.dart';
import 'package:themby/page/home/widgets/server_list.dart';
import '../../generated/l10n.dart';


class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var homeVM = ref.watch(homeVMProvider.notifier);
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).link,style: Theme.of(context).textTheme.titleLarge),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              homeVM.openDialog();
            },
          ),
        ],
      ),
      body: const ServerList(),
    );
  }
}