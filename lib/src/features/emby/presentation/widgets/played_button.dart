import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:themby/src/features/emby/data/favorite_repository.dart';
import 'package:themby/src/features/emby/data/view_repository.dart';

class PlayedButton extends ConsumerStatefulWidget{
  const PlayedButton({super.key, required this.id, required this.played});

  final String id;
  final bool played;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>  _LikeButton();

}

class _LikeButton extends ConsumerState<PlayedButton>{

  bool played = false;

  @override
  void initState() {
    super.initState();
    played = widget.played;
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: press,
        icon: played ? const Icon(Icons.check_circle, color: Colors.green,size: 28)
            : const Icon(Icons.check_circle_outline_rounded, size: 28,)
    );
  }


  Future<void> press() async {

    ref.read(togglePlayedProvider(widget.id, !played).future).then((userData) {
      if(userData.played == true) {

      }
      ref.refresh(
          getItemProvider(
              itemQuery: (
              page: 0,
              parentId: '',
              includeItemTypes: 'Movie',
              sortBy: 'SortName',
              sortOrder: 'Ascending',
              filters: 'IsFavorite',
              )
          )
      );
      ref.refresh(
          getItemProvider(
              itemQuery: (
              page: 0,
              parentId: '',
              includeItemTypes: 'Series',
              sortBy: 'SortName',
              sortOrder: 'Ascending',
              filters: 'IsFavorite',
              )
          )
      );
      ref.refresh(GetMediaProvider(widget.id));
    });
    setState(() {
      played = !played;
    });
  }
}
