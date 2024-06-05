
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:themby/src/features/emby/application/emby_state_service.dart';
import 'package:themby/src/features/home/data/site_repository.dart';
import 'package:themby/src/features/home/presentation/home_server_notifier.dart';
import 'package:themby/src/localization/string_hardcoded.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text('链接'.hardcoded),
        actions: [
          IconButton(
            color: Theme.of(context).colorScheme.primary,
            icon: const Icon(Icons.add_circle_outline),
            onPressed: () {
              ref.read(homeServerNotifierProvider.notifier).openAddDialog();
            },
          ),
        ],
      ),
      body: Card(
        clipBehavior: Clip.antiAlias,
        elevation: 0,
        color: Theme.of(context).appBarTheme.backgroundColor,
        margin: const EdgeInsets.all(16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child:  const ServerList(),
      ),
    );
  }
}

class ServerList extends ConsumerWidget {
  const ServerList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final sites = ref.watch(getSitesProvider);

    return ListView.separated(
      shrinkWrap: true,
      itemCount: sites.valueOrNull?.length ?? 0,
      itemBuilder: (context, index) {

        return sites.when(
            error:  (error, stack) {
              return const Center(child: Text('Error'));
            },
            loading: () {
              return const Center(child: CircularProgressIndicator());
            },
            data: (data) {
              return ListTile(
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
                        SmartDialog.showToast('点击了Emby');
                      },
                    ),
                  ],
                ),
                onTap: () async {
                  ref.read(embyStateServiceProvider.notifier).updateSite(data[index]);
                  ref.read(embyStateServiceProvider.notifier).addUserIdToToken(data[index].accessToken!);
                  GoRouter.of(context).go('/emby');
                },
              );
            },
        );
      },
      separatorBuilder: (context, index) {
        return Container(
          margin: const EdgeInsets.only(left: 64, right: 16),
          child: Divider(
            thickness: 1,
            height: 1,
            color: Colors.grey.withOpacity(0.2),
          ),
        );
      },
    );
  }
}