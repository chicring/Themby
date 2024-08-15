import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:themby/src/common/domiani/site.dart';
import 'package:themby/src/features/emby/application/emby_state_service.dart';
import 'package:themby/src/features/emby/data/image_repository.dart';
import 'package:themby/src/features/emby/data/view_repository.dart';
import 'package:themby/src/features/emby/presentation/emby_view/emby_media_library.dart';
import 'package:themby/src/features/emby/presentation/emby_view/emby_recommendations_media.dart';
import 'package:themby/src/features/emby/presentation/emby_view/emby_resume_media.dart';
import 'package:themby/src/features/emby/presentation/emby_view/emby_view.dart';

class EmbyHomeScreen extends ConsumerWidget {
  const EmbyHomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final site = ref.watch(embyStateServiceProvider.select((value) => value.site));

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: _buildAppBar(site!,context),
      body: RefreshIndicator(
        onRefresh: () async {
          await ref.refresh(getResumeMediaProvider().future);
          await ref.refresh(getViewsProvider.future).then((data){
            data.items.map((item) async{
              ref.refresh(getLastMediaProvider(item.id!));
            });
          });
        },
        child: const CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: EmbyRecommendationsMedia(),
            ),
            SliverToBoxAdapter(
              child: SizedBox(height: 18),
            ),
            SliverToBoxAdapter(
              child: EmbyResumeMedia(),
            ),
            SliverToBoxAdapter(
              child: EmbyView(),
            ),
            SliverToBoxAdapter(
              child: EmbyMediaLibrary(),
            ),
          ],
        )
      ),
    );
  }
}


AppBar _buildAppBar(Site site, BuildContext context) {
  return AppBar(
    scrolledUnderElevation: 0.0,
    backgroundColor: Colors.transparent,
    leading: IconButton(
      icon: SvgPicture.asset('assets/emby.svg', width: 30, height: 30),
      onPressed: () {
        GoRouter.of(context).go('/home');
      },
    ),

    actions: [
        IconButton(
          icon: const Icon(Icons.search_rounded, size: 30,),
          color: Colors.white,
          onPressed: () {
            GoRouter.of(context).push('/emby/search');
          },
        ),
        IconButton(
          icon: site.imageTag != null  ? CachedNetworkImage(
            imageUrl: getAvatarUrl(site),
            placeholder: (context,url) => const CircularProgressIndicator(),
            imageBuilder: (context, imageProvider) => CircleAvatar(
              backgroundImage: imageProvider,
            ),
            errorWidget: (context, url, error) => CircleAvatar(
              backgroundColor: Theme.of(context).colorScheme.onPrimary,
              child: Text(
                (site.username ?? 'T')[0].toUpperCase(),
              ),
            ),
          ) : CircleAvatar(
            child: Text(
              (site.username ?? 'A')[0].toUpperCase(),
            ),
          ),
          onPressed: () {
            SmartDialog.showToast('别点我，我是头像');
          },
        ),
      ],
  );
}