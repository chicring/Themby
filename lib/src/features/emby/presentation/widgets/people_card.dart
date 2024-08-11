import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:themby/src/common/constants.dart';
import 'package:themby/src/common/widget/network_img_layer.dart';
import 'package:themby/src/features/emby/application/emby_state_service.dart';
import 'package:themby/src/features/emby/data/image_repository.dart';
import 'package:themby/src/features/emby/domain/emby/person.dart';
import 'package:themby/src/features/emby/domain/image_props.dart';

class PeopleCard extends ConsumerWidget{

  const PeopleCard({
    super.key,
    required this.person,
    required this.width,
    required this.height,
    this.press,
    this.longPress,
    this.longPressEnd
  });

  final Person person;

  final double width;

  final double height;

  final Function()? press;

  final Function()? longPress;

  final Function()? longPressEnd;

  @override
  Widget build(BuildContext context,WidgetRef ref) {

    final site = ref.watch(embyStateServiceProvider.select((value) => value.site));

    return Card(
      elevation: 0,
      clipBehavior: Clip.hardEdge,
      margin: EdgeInsets.zero,
      color: Colors.transparent,
      child: InkWell(
        onTap: () async {

        },
        onLongPress: () async {

        },
        child: Column(
          children: [
            NetworkImgLayer(
              imageUrl: getImageUrl(
                  site!,
                  person.id ?? '',
                  ImageProps(
                    tag: person.primaryImageTag ?? '',
                    type: ImageType.primary,
                    maxWidth: 400,
                  )
              ),
              type: "people",
              width: width,
              height: height,
            ),
            SizedBox(
              width: width,
              child: Content(person: person),
            ),
          ],
        ),
      ),
    );
  }
}

class Content extends StatelessWidget{
  const Content({super.key, required this.person});

  final Person person;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(4, 3, 0, 3),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            person.name ?? '',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 12,
            ),
          ),
          const SizedBox(height: 3),
          Text(
            person.role ?? '',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 11,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}