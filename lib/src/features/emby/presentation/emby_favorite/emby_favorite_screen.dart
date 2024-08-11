
import 'package:flutter/material.dart';

import 'emby_favorite_item.dart';

class EmbyFavoriteScreen extends StatelessWidget {
  const EmbyFavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('我的收藏'),
      ),
      body: const SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            EmbyFavoriteItem(type: 'movie'),

            EmbyFavoriteItem(type: 'series')
          ],
        ),
      ),
    );
  }
}