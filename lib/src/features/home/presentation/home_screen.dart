
import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:flutter_svg/svg.dart';
import 'package:themby/src/localization/string_hardcoded.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('链接'.hardcoded),
        actions: [
          IconButton(
            color: Theme.of(context).colorScheme.primary,
            icon: const Icon(Icons.add_circle_outline),
            onPressed: () {
              SmartDialog.showToast("我是按钮");
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
        child: const ServerList(),
      ),
    );
  }
}

class ServerList extends StatelessWidget {
  const ServerList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      itemCount: 3,
      itemBuilder: (context, index) {
        return ListTile(
          contentPadding: const EdgeInsets.only(right: 8, left: 16),
          dense: true,
          leading: SvgPicture.asset('assets/emby.svg', width: 36, height: 36),
          title: const Text('Emby', style: TextStyle(fontWeight: FontWeight.w500)),
          subtitle: const Text('Emby', style: TextStyle(fontWeight: FontWeight.w300)),
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
          onTap: () {
            SmartDialog.showToast('进入Emby');
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