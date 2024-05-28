import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:themby/common/models/emby_site.dart';

import '../view_model.dart';

class ServerList extends ConsumerWidget {
  const ServerList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // List<EmbySite> sites = ref.watch(homeVMProvider.select((value) => value.sites));
    return Card(
      clipBehavior: Clip.antiAlias,
      elevation: 0,
      margin: const EdgeInsets.all(16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: _buildList(ref),
    );
  }

  Widget _buildList(WidgetRef ref) {
    List<EmbySite> sites = ref.watch(homeVMProvider.select((value) => value.sites));

    if (sites.isNotEmpty) {
      return ListView.separated(
        shrinkWrap: true,
        itemCount: sites.length,
        itemBuilder: (context, index) {
          final site = sites[index];
          return ListTile(
            contentPadding: const EdgeInsets.only(right: 8, left: 16),
            leading: SvgPicture.asset('assets/emby.svg', width: 36, height: 36),
            title: Text(site.serverName ?? site.host!, style: const TextStyle(fontWeight: FontWeight.w500)),
            dense: true,
            subtitle: Text(site.name!, style: TextStyle(color: Colors.black.withOpacity(0.5))),
            trailing: IconButton(
              icon: const Icon(Icons.more_horiz),
              onPressed: () {
                ref.read(homeVMProvider.notifier).removeSite(site);
              },
            ),
            onTap: () {
              SmartDialog.showToast('点击了${site.serverName} ${site.id}');
            },
          );
        },
        separatorBuilder: (context, index) => Container(
          margin: const EdgeInsets.only(left: 16, right: 16),
          child: Divider(
            thickness: 1,
            height: 1,
            color: Colors.grey.withOpacity(0.1),
          ),
        ),
      );
    } else if (sites.isEmpty) {
      // 返回一个提示列表为空的 Widget
      return const Center(child: Text('没有站点'));
    } else {
      // 返回一个错误提示的 Widget
      return const Center(child: Text('发生了错误'));
    }
  }
}