import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:themby/src/features/emby/application/emby_state_service.dart';
import 'package:themby/src/features/emby/data/image_repository.dart';
import 'package:themby/src/features/emby/presentation/emby_search/emby_search.dart';
import 'package:themby/src/features/emby/presentation/emby_view/emby_view.dart';

class EmbyHomeScreen extends ConsumerWidget {
  const EmbyHomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final site = ref.watch(embyStateServiceProvider.select((value) => value.site));
    return Scaffold(
      appBar: AppBar(
        title: SvgPicture.asset('assets/emby.svg', width: 28, height: 28),
        actions: [
          IconButton(
            icon: site?.imageTag != null  ? CachedNetworkImage(
              imageUrl: getAvatarUrl(site!),
              placeholder: (context,url) => const CircularProgressIndicator(),
              imageBuilder: (context, imageProvider) => CircleAvatar(
                backgroundImage: imageProvider,
              ),
              errorWidget: (context, url, error) => CircleAvatar(
                backgroundColor: Theme.of(context).colorScheme.onPrimary,
                child: Text(
                  (site.username ?? 'A')[0].toUpperCase(),
                ),
              ),
            ) : CircleAvatar(
              backgroundColor: Theme.of(context).colorScheme.onPrimary,
              child: Text(
                (site?.username ?? 'A')[0].toUpperCase(),
              ),
            ),
            onPressed: () {
              SmartDialog.showToast('别点我，我是头像');
            },
          ),
        ],
      ),
      body: const EmbyView(),
    );
  }
}