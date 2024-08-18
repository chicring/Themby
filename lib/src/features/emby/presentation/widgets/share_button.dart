

import 'package:android_intent_plus/android_intent.dart';
import 'package:android_intent_plus/flag.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:flutter_svg/svg.dart';
import 'package:themby/src/common/constants.dart';
import 'package:themby/src/features/emby/data/play_repository.dart';
import 'package:url_launcher/url_launcher_string.dart';

class ShareButton extends ConsumerWidget{
  const ShareButton(this.id, {super.key});

  final String id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    void openSheet() async{
      String url = await ref.read(getPlayerUrlProvider(id,index: 0).future);
      SmartDialog.show(
        tag: "share",
        alignment: Alignment.center,
        builder: (_) => _shareSheet(url,context),
      );
    }

    return IconButton(
      icon: const Icon(Icons.share_rounded),
      onPressed: (){
        openSheet();
      },
    );
  }

  Widget _shareSheet(String url,BuildContext context){


    void openApp(String uri) async{
      await launchUrlString(uri).catchError((e){
        SmartDialog.showToast('未找到对应的应用');
        return false;
      });
    }

    void openMxPlayer(String videoUrl) async {
      final intent = AndroidIntent(
        action: 'action_view',
        data: videoUrl,
        type: "video/*",
      );

      try {
        await intent.launch();
      } catch (e) {
        print('无法打开 MX Player: $e');
      }
    }

    return Container(
      padding: const EdgeInsets.all(12),
      constraints: const BoxConstraints(
        maxWidth: 500,
        minWidth: 300
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('外部播放器',style: StyleString.titleStyle),
          const Text('使用外部播放器不能回传播放记录', style: StyleString.subtitleStyle),

          Wrap(
            alignment: WrapAlignment.start,
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: 6,
            runSpacing: 6,
            children: [
              IconButton(
                icon: SvgPicture.asset("assets/icon/potplayer.svg",width: 56,height: 56),
                onPressed: (){
                  openApp("potplayer://$url");
                },
              ),
              IconButton(
                icon: SvgPicture.asset("assets/icon/vlc.svg",width: 52,height: 52),
                onPressed: (){
                  openApp("vlc://$url");
                },
              ),
              IconButton(
                icon: const Icon(Icons.more_horiz_rounded,size: 38,),
                onPressed: (){
                  openMxPlayer(url);
                },
              )
            ],
          ),
        ],
      ),
    );
  }
}
