import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:themby/src/common/constants.dart';
import 'package:themby/src/common/widget/header_text.dart';
import 'package:themby/src/features/emby/domain/media.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:themby/src/features/emby/presentation/widget/media_card_v.dart';

class ListCardsH extends ConsumerWidget{
  const ListCardsH({super.key, required this.name, required this.parentId, required this.medias});

  final String name;
  final String parentId;
  final List<Media> medias;


  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            HeaderText(text: name),

            TextButton(
              onPressed: () async{
                GoRouter.of(context).push(Uri(path: '/library/$parentId', queryParameters: {'title': name}).toString());
              },
              child: const Text('查看更多'),
            ),
          ],
        ),
        SizedBox(
          height: MediaQuery.sizeOf(context).height * 0.18 + 55,
          child: medias.isEmpty ?
            const Center(child: Text('暂无数据')) :
            ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: medias.length,
                itemBuilder: (context, index) {
                  return Container(
                    width: MediaQuery.sizeOf(context).height * 0.117,
                    height: MediaQuery.sizeOf(context).height * 0.18,
                    margin: const EdgeInsets.only(
                      left: StyleString.safeSpace,
                    ),
                    child: MediaCardV(
                      media: medias[index],
                    ),
                  );
                },
            ),
        )
      ],
    );
  }
}