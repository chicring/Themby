import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:flutter_svg/svg.dart';
import 'package:themby/src/features/emby/application/emby_state_service.dart';
import 'package:themby/src/features/emby/presentation/emby_search/emby_search.dart';

class EmbyHomeScreen extends ConsumerWidget {
  const EmbyHomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final site = ref.watch(embyStateServiceProvider.select((value) => value.site));
    return Scaffold(
      appBar: AppBar(
        title: SvgPicture.asset('assets/emby.svg', width: 24, height: 24),
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
      body: const Column(
        children: [
          EmbySearch(),
        ],
      )
    );
  }
}