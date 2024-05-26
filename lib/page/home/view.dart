import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:themby/page/home/state.dart';
import 'package:themby/page/home/view_model.dart';
import 'package:themby/page/home/widgets/add_server_dialog.dart';

import '../../generated/l10n.dart';
import 'package:themby/common/global.dart';
class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    HomeState homeState = ref.watch(homeVMProvider);
    var homeVM = ref.watch(homeVMProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).link,style: Theme.of(context).textTheme.titleLarge),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return const AddServerDialog();
                },
              );
            },
          ),
        ],
      ),
      body: Center(
        child: const Text('Hello World'),
      ),
    );
  }
}