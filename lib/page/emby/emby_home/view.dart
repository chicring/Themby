import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:themby/page/emby/emby_home/widget/emby_list_view.dart';

class EmbyHome extends StatelessWidget {

  const EmbyHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          IconButton(
            icon: CachedNetworkImage(
              imageUrl: 'https://i109.com/emby/Users/37f1f815efb94df98b2b1b82186b38ca/Images/Primary?tag=f190e7b0fd3fa56a27a24d1442350481',
              placeholder: (context,url) => const CircularProgressIndicator(),
              imageBuilder: (context, imageProvider) => CircleAvatar(
                backgroundImage: imageProvider,
              ),
            ),
            onPressed: () {
              SmartDialog.showToast('别点我，我是头像');
            },
          ),
        ],
      ),
      body: const EmbyListView()
    );
  }
}