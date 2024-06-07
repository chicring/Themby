

import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:themby/src/common/domiani/site.dart';
import 'package:themby/src/features/emby/application/emby_state_service.dart';
import 'package:themby/src/features/emby/domain/view.dart';
import 'package:themby/src/helper/dio_provider.dart';

part 'view_repository.g.dart';

class ViewRepository{

  ViewRepository({required this.client, required this.site, required this.embyToken});

  final Dio client;

  final Site site;
  final String embyToken;


  Future<View> getViews() async {
    final response = await client.getUri(
      Uri(
        scheme: site.scheme,
        host: site.host,
        port: site.port,
        path: '/emby/Users/${site.userId}/Views',
      ),
      options: Options(
        headers: {
          'X-Emby-Authorization': embyToken,
          'x-emby-token': site.accessToken,
        }
      )
    );
    print(response.data);
    return View.fromJson(response.data);
  }

}

@riverpod
ViewRepository viewRepository(ViewRepositoryRef ref) => ViewRepository(
  client: ref.watch(dioProvider),
  site: ref.watch(embyStateServiceProvider.select((value) => value.site!)),
  embyToken: ref.watch(embyStateServiceProvider.select((value) => value.token)),
);


@riverpod
Future<View> getViews(GetViewsRef ref) => ref.read(viewRepositoryProvider).getViews();