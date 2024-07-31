import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:themby/src/features/emby/data/favorite_repository.dart';
import 'package:themby/src/features/emby/data/view_repository.dart';

class LikeButton extends ConsumerStatefulWidget{
  const LikeButton({super.key, required this.id, required this.liked});

  final String id;
  final bool liked;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>  _LikeButton();

}

class _LikeButton extends ConsumerState<LikeButton>{

  bool liked = false;

  @override
  void initState() {
    super.initState();
    liked = widget.liked;
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: press,
        icon: liked ? const Icon(Icons.favorite_rounded, color: Color(0xFFc45a65),size: 28)
            : const Icon(Icons.favorite_border_rounded, size: 28)
    );
  }


  Future<void> press() async {

    ref.read(toggleFavoriteProvider(widget.id, !liked).future).then((userData) {
      if(userData.isFavorite == true) {
        SmartDialog.showToast('收藏成功');

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
      liked = !liked;
    });
  }
}
