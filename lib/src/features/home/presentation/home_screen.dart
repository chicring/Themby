
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:themby/src/common/constants.dart';
import 'package:themby/src/features/emby/application/emby_state_service.dart';
import 'package:themby/src/features/home/data/site_repository.dart';
import 'package:themby/src/features/home/presentation/home_server_notifier.dart';
import 'package:themby/src/localization/string_hardcoded.dart';

import 'home_ search.dart';
import 'home_search_query_notifier.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final String query = ref.watch(homeSearchQueryNotifierProvider);

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(homeServerNotifierProvider.notifier).openAddDialog();
        },
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        title: Text('连接'.hardcoded, style: StyleString.headerStyle.copyWith(fontSize: 30)),
        actions: [
          IconButton(
              icon: const Icon(Icons.cloud_sync),
              onPressed: () {
              }
          ),
          IconButton(
            icon: const Icon(Icons.settings_rounded),
            onPressed: () {
              GoRouter.of(context).push('/mine');
            },
          ),
        ],
      ),
      body:  Column(
        children: [
          const SizedBox(height: 10),
          const HomeSearch(),
          const SizedBox(height: 10),

          Expanded(
            child: RefreshIndicator(
              onRefresh: () async {
                ref.refresh(finaAllByTextProvider(text: query));
              },
              child: const ServerList(),
            ),
          ),
        ],
      ),
    );
  }
}

class ServerList extends ConsumerWidget {
  const ServerList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final String query = ref.watch(homeSearchQueryNotifierProvider);

    final sites = ref.watch(finaAllByTextProvider(text: query));

    return ListView.builder(
      key: ValueKey(query),
      itemCount: sites.valueOrNull?.length ?? 0,
      padding: const EdgeInsets.symmetric(horizontal: StyleString.safeSpace),
      itemBuilder: (context, index) {
        return sites.when(
            error:  (error, stack) {
              return const Center(child: Text('Error'));
            },
            loading: () {
              return const SizedBox();
            },
            data: (data) {
              return Card(
                clipBehavior: Clip.antiAlias,
                elevation: 0,
                child: ListTile(
                  contentPadding: const EdgeInsets.only(right: 8, left: 16),
                  dense: true,
                  leading: SvgPicture.asset('assets/emby.svg', width: 36, height: 36),
                  title: Text(data[index].serverName!, style: const TextStyle(fontWeight: FontWeight.w500)),
                  subtitle: Text(data[index].username!, style: const TextStyle(fontWeight: FontWeight.w300)),
                  trailing: PopupMenuButton<int>(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    icon: const Icon(Icons.more_horiz),
                    itemBuilder: (BuildContext context) => <PopupMenuEntry<int>>[
                      PopupMenuItem<int>(
                        value: 0,
                        child: const ListTile(
                          leading: Icon(Icons.edit),
                          title: Text('编辑'),
                        ),
                        onTap: () {
                          SmartDialog.showToast('点击了Emby');
                        },
                      ),
                      PopupMenuItem<int>(
                        value: 1,
                        child: const ListTile(
                          leading: Icon(Icons.delete),
                          title: Text('删除'),
                        ),
                        onTap: () {
                          ref.read(homeServerNotifierProvider.notifier).removeSite(data[index]);
                        },
                      ),
                    ],
                  ),
                  onTap: () async {
                    ref.read(embyStateServiceProvider.notifier).updateSite(data[index]);
                    ref.read(embyStateServiceProvider.notifier).addUserIdToToken(data[index].userId!);
                    GoRouter.of(context).go('/emby');
                  },
                ),
              );
            },
        );
      },
    );
  }
}