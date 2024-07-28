

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:themby/src/common/constants.dart';
import 'package:themby/src/features/emby/domain/media_detail.dart';
import 'package:url_launcher/url_launcher.dart';

class EmbyDetailExternalLinks extends StatelessWidget{
  const EmbyDetailExternalLinks({super.key, required this.externalUrls});

  final List<ExternalUrl> externalUrls;

  Widget buildAvatar(String name) {
    return name == 'IMDb'
        ? SvgPicture.asset('assets/icon/imdb.svg', height: 18)
        : name == 'MovieDb'
        ? SvgPicture.asset('assets/icon/tmdb.svg', height: 18)
        : name == 'TheTVDB'
        ? SvgPicture.asset('assets/icon/tv-db-seeklogo.svg', height: 18)
        : name == 'Trakt'
        ? SvgPicture.asset('assets/icon/trakt-icon-red.svg', height: 18)
        : const Icon(Icons.link);
  }

  @override
  Widget build(BuildContext context) {
    return externalUrls.isNotEmpty
        ? Container(
      margin: const EdgeInsets.symmetric(horizontal: StyleString.safeSpace),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '外部链接',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          SizedBox(
            height: 40,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: externalUrls.length,
              itemBuilder: (context,index) {
                return Container(
                  margin: const EdgeInsets.only(right: 10), // Add this line to add space to the right of each item
                  child: ActionChip(
                    onPressed: (){
                      launchUrl(Uri.parse(externalUrls[index].url));
                    },
                    avatar: buildAvatar(externalUrls[index].name),
                    shape: RoundedRectangleBorder(
                      borderRadius: StyleString.mdRadius,
                    ),
                    label: Text(externalUrls[index].name),
                  ),
                );
              },
            ),
          )
        ],
      ),
    )
        : const SizedBox();
  }
}