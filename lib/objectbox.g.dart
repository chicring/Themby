// GENERATED CODE - DO NOT MODIFY BY HAND
// This code was generated by ObjectBox. To update it run the generator again
// with `dart run build_runner build`.
// See also https://docs.objectbox.io/getting-started#generate-objectbox-code

// ignore_for_file: camel_case_types, depend_on_referenced_packages
// coverage:ignore-file

import 'dart:typed_data';

import 'package:flat_buffers/flat_buffers.dart' as fb;
import 'package:objectbox/internal.dart'
    as obx_int; // generated code can access "internal" functionality
import 'package:objectbox/objectbox.dart' as obx;
import 'package:objectbox_flutter_libs/objectbox_flutter_libs.dart';

import 'src/common/domiani/cache_response.dart';
import 'src/common/domiani/site.dart';
import 'src/helper/objectbox_cache_store.dart';

export 'package:objectbox/objectbox.dart'; // so that callers only have to import this file

final _entities = <obx_int.ModelEntity>[
  obx_int.ModelEntity(
      id: const obx_int.IdUid(2, 5645114341643632039),
      name: 'Site',
      lastPropertyId: const obx_int.IdUid(14, 3027875153999223532),
      flags: 0,
      properties: <obx_int.ModelProperty>[
        obx_int.ModelProperty(
            id: const obx_int.IdUid(1, 1212673333540335368),
            name: 'id',
            type: 6,
            flags: 1),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(2, 3640520148684444582),
            name: 'remake',
            type: 9,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(3, 4898995076079415971),
            name: 'type',
            type: 9,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(4, 3003311859851361361),
            name: 'serverId',
            type: 9,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(5, 7301533263769584760),
            name: 'serverName',
            type: 9,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(6, 9102264803814905307),
            name: 'version',
            type: 9,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(7, 7012978269029942606),
            name: 'scheme',
            type: 9,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(8, 6631935823621729830),
            name: 'host',
            type: 9,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(9, 6133830140089446468),
            name: 'port',
            type: 6,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(10, 6862914296698799589),
            name: 'userId',
            type: 9,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(11, 4479031352255511566),
            name: 'username',
            type: 9,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(12, 519014527814544263),
            name: 'password',
            type: 9,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(13, 7922330355146480878),
            name: 'imageTag',
            type: 9,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(14, 3027875153999223532),
            name: 'accessToken',
            type: 9,
            flags: 0)
      ],
      relations: <obx_int.ModelRelation>[],
      backlinks: <obx_int.ModelBacklink>[]),
  obx_int.ModelEntity(
      id: const obx_int.IdUid(3, 6857104696818981759),
      name: 'CacheControlBox',
      lastPropertyId: const obx_int.IdUid(9, 1903083576837791941),
      flags: 0,
      properties: <obx_int.ModelProperty>[
        obx_int.ModelProperty(
            id: const obx_int.IdUid(1, 1803865000160454572),
            name: 'id',
            type: 6,
            flags: 1),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(2, 4769377239963618210),
            name: 'maxAge',
            type: 6,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(3, 5587868630683166036),
            name: 'privacy',
            type: 9,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(4, 2611406806916646961),
            name: 'noCache',
            type: 1,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(5, 3709939775490030854),
            name: 'noStore',
            type: 1,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(6, 7952440488360469799),
            name: 'other',
            type: 30,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(7, 1147364848637487559),
            name: 'maxStale',
            type: 6,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(8, 7771530198643672858),
            name: 'minFresh',
            type: 6,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(9, 1903083576837791941),
            name: 'mustRevalidate',
            type: 1,
            flags: 0)
      ],
      relations: <obx_int.ModelRelation>[],
      backlinks: <obx_int.ModelBacklink>[]),
  obx_int.ModelEntity(
      id: const obx_int.IdUid(4, 5704279771685456028),
      name: 'CacheResponseBox',
      lastPropertyId: const obx_int.IdUid(14, 6785491269180878786),
      flags: 0,
      properties: <obx_int.ModelProperty>[
        obx_int.ModelProperty(
            id: const obx_int.IdUid(1, 8754635423653364216),
            name: 'id',
            type: 6,
            flags: 1),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(2, 7143290272839801058),
            name: 'key',
            type: 9,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(3, 8200230048991573849),
            name: 'content',
            type: 23,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(4, 7310960758278894875),
            name: 'date',
            type: 10,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(5, 3253148527008784613),
            name: 'eTag',
            type: 9,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(6, 3880121084084456719),
            name: 'expires',
            type: 10,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(7, 3363289641270316356),
            name: 'headers',
            type: 23,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(8, 3663287813320194046),
            name: 'lastModified',
            type: 9,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(9, 7897979406134574332),
            name: 'maxStale',
            type: 10,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(10, 1538767300804095279),
            name: 'responseDate',
            type: 10,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(11, 1447785889798735642),
            name: 'requestDate',
            type: 10,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(12, 6420992281219320445),
            name: 'url',
            type: 9,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(13, 3619687227802694612),
            name: 'priority',
            type: 6,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(14, 6785491269180878786),
            name: 'cacheControlId',
            type: 11,
            flags: 520,
            indexId: const obx_int.IdUid(2, 2998580078795400146),
            relationTarget: 'CacheControlBox')
      ],
      relations: <obx_int.ModelRelation>[],
      backlinks: <obx_int.ModelBacklink>[]),
  obx_int.ModelEntity(
      id: const obx_int.IdUid(5, 7781721421052415849),
      name: 'CacheResponse',
      lastPropertyId: const obx_int.IdUid(3, 5185220916281748578),
      flags: 0,
      properties: <obx_int.ModelProperty>[
        obx_int.ModelProperty(
            id: const obx_int.IdUid(1, 4500478617701732637),
            name: 'id',
            type: 6,
            flags: 1),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(2, 6938205856489861715),
            name: 'key',
            type: 9,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(3, 5185220916281748578),
            name: 'content',
            type: 9,
            flags: 0)
      ],
      relations: <obx_int.ModelRelation>[],
      backlinks: <obx_int.ModelBacklink>[])
];

/// Shortcut for [obx.Store.new] that passes [getObjectBoxModel] and for Flutter
/// apps by default a [directory] using `defaultStoreDirectory()` from the
/// ObjectBox Flutter library.
///
/// Note: for desktop apps it is recommended to specify a unique [directory].
///
/// See [obx.Store.new] for an explanation of all parameters.
///
/// For Flutter apps, also calls `loadObjectBoxLibraryAndroidCompat()` from
/// the ObjectBox Flutter library to fix loading the native ObjectBox library
/// on Android 6 and older.
Future<obx.Store> openStore(
    {String? directory,
    int? maxDBSizeInKB,
    int? maxDataSizeInKB,
    int? fileMode,
    int? maxReaders,
    bool queriesCaseSensitiveDefault = true,
    String? macosApplicationGroup}) async {
  await loadObjectBoxLibraryAndroidCompat();
  return obx.Store(getObjectBoxModel(),
      directory: directory ?? (await defaultStoreDirectory()).path,
      maxDBSizeInKB: maxDBSizeInKB,
      maxDataSizeInKB: maxDataSizeInKB,
      fileMode: fileMode,
      maxReaders: maxReaders,
      queriesCaseSensitiveDefault: queriesCaseSensitiveDefault,
      macosApplicationGroup: macosApplicationGroup);
}

/// Returns the ObjectBox model definition for this project for use with
/// [obx.Store.new].
obx_int.ModelDefinition getObjectBoxModel() {
  final model = obx_int.ModelInfo(
      entities: _entities,
      lastEntityId: const obx_int.IdUid(5, 7781721421052415849),
      lastIndexId: const obx_int.IdUid(2, 2998580078795400146),
      lastRelationId: const obx_int.IdUid(0, 0),
      lastSequenceId: const obx_int.IdUid(0, 0),
      retiredEntityUids: const [7455008044318180262],
      retiredIndexUids: const [2827523073541992988],
      retiredPropertyUids: const [
        1762118529947504797,
        3651706648616444539,
        4641444923789978010,
        8573089567954918477,
        3955013655561428620,
        3849993164329572110,
        4799706280379794334,
        769655657430990892,
        1067789483975296624,
        6471076450128067201,
        2656011792185097661,
        930762010843227438,
        8399095080819489311
      ],
      retiredRelationUids: const [],
      modelVersion: 5,
      modelVersionParserMinimum: 5,
      version: 1);

  final bindings = <Type, obx_int.EntityDefinition>{
    Site: obx_int.EntityDefinition<Site>(
        model: _entities[0],
        toOneRelations: (Site object) => [],
        toManyRelations: (Site object) => {},
        getId: (Site object) => object.id,
        setId: (Site object, int id) {
          object.id = id;
        },
        objectToFB: (Site object, fb.Builder fbb) {
          final remakeOffset =
              object.remake == null ? null : fbb.writeString(object.remake!);
          final typeOffset =
              object.type == null ? null : fbb.writeString(object.type!);
          final serverIdOffset = object.serverId == null
              ? null
              : fbb.writeString(object.serverId!);
          final serverNameOffset = object.serverName == null
              ? null
              : fbb.writeString(object.serverName!);
          final versionOffset =
              object.version == null ? null : fbb.writeString(object.version!);
          final schemeOffset =
              object.scheme == null ? null : fbb.writeString(object.scheme!);
          final hostOffset =
              object.host == null ? null : fbb.writeString(object.host!);
          final userIdOffset =
              object.userId == null ? null : fbb.writeString(object.userId!);
          final usernameOffset = object.username == null
              ? null
              : fbb.writeString(object.username!);
          final passwordOffset = object.password == null
              ? null
              : fbb.writeString(object.password!);
          final imageTagOffset = object.imageTag == null
              ? null
              : fbb.writeString(object.imageTag!);
          final accessTokenOffset = object.accessToken == null
              ? null
              : fbb.writeString(object.accessToken!);
          fbb.startTable(15);
          fbb.addInt64(0, object.id);
          fbb.addOffset(1, remakeOffset);
          fbb.addOffset(2, typeOffset);
          fbb.addOffset(3, serverIdOffset);
          fbb.addOffset(4, serverNameOffset);
          fbb.addOffset(5, versionOffset);
          fbb.addOffset(6, schemeOffset);
          fbb.addOffset(7, hostOffset);
          fbb.addInt64(8, object.port);
          fbb.addOffset(9, userIdOffset);
          fbb.addOffset(10, usernameOffset);
          fbb.addOffset(11, passwordOffset);
          fbb.addOffset(12, imageTagOffset);
          fbb.addOffset(13, accessTokenOffset);
          fbb.finish(fbb.endTable());
          return object.id;
        },
        objectFromFB: (obx.Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);
          final idParam =
              const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0);
          final remakeParam = const fb.StringReader(asciiOptimization: true)
              .vTableGetNullable(buffer, rootOffset, 6);
          final typeParam = const fb.StringReader(asciiOptimization: true)
              .vTableGetNullable(buffer, rootOffset, 8);
          final serverIdParam = const fb.StringReader(asciiOptimization: true)
              .vTableGetNullable(buffer, rootOffset, 10);
          final serverNameParam = const fb.StringReader(asciiOptimization: true)
              .vTableGetNullable(buffer, rootOffset, 12);
          final versionParam = const fb.StringReader(asciiOptimization: true)
              .vTableGetNullable(buffer, rootOffset, 14);
          final schemeParam = const fb.StringReader(asciiOptimization: true)
              .vTableGetNullable(buffer, rootOffset, 16);
          final hostParam = const fb.StringReader(asciiOptimization: true)
              .vTableGetNullable(buffer, rootOffset, 18);
          final portParam =
              const fb.Int64Reader().vTableGetNullable(buffer, rootOffset, 20);
          final userIdParam = const fb.StringReader(asciiOptimization: true)
              .vTableGetNullable(buffer, rootOffset, 22);
          final usernameParam = const fb.StringReader(asciiOptimization: true)
              .vTableGetNullable(buffer, rootOffset, 24);
          final passwordParam = const fb.StringReader(asciiOptimization: true)
              .vTableGetNullable(buffer, rootOffset, 26);
          final imageTagParam = const fb.StringReader(asciiOptimization: true)
              .vTableGetNullable(buffer, rootOffset, 28);
          final accessTokenParam =
              const fb.StringReader(asciiOptimization: true)
                  .vTableGetNullable(buffer, rootOffset, 30);
          final object = Site(
              id: idParam,
              remake: remakeParam,
              type: typeParam,
              serverId: serverIdParam,
              serverName: serverNameParam,
              version: versionParam,
              scheme: schemeParam,
              host: hostParam,
              port: portParam,
              userId: userIdParam,
              username: usernameParam,
              password: passwordParam,
              imageTag: imageTagParam,
              accessToken: accessTokenParam);

          return object;
        }),
    CacheControlBox: obx_int.EntityDefinition<CacheControlBox>(
        model: _entities[1],
        toOneRelations: (CacheControlBox object) => [],
        toManyRelations: (CacheControlBox object) => {},
        getId: (CacheControlBox object) => object.id,
        setId: (CacheControlBox object, int id) {
          object.id = id;
        },
        objectToFB: (CacheControlBox object, fb.Builder fbb) {
          final privacyOffset =
              object.privacy == null ? null : fbb.writeString(object.privacy!);
          final otherOffset = object.other == null
              ? null
              : fbb.writeList(
                  object.other!.map(fbb.writeString).toList(growable: false));
          fbb.startTable(10);
          fbb.addInt64(0, object.id ?? 0);
          fbb.addInt64(1, object.maxAge);
          fbb.addOffset(2, privacyOffset);
          fbb.addBool(3, object.noCache);
          fbb.addBool(4, object.noStore);
          fbb.addOffset(5, otherOffset);
          fbb.addInt64(6, object.maxStale);
          fbb.addInt64(7, object.minFresh);
          fbb.addBool(8, object.mustRevalidate);
          fbb.finish(fbb.endTable());
          return object.id ?? 0;
        },
        objectFromFB: (obx.Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);
          final idParam =
              const fb.Int64Reader().vTableGetNullable(buffer, rootOffset, 4);
          final maxAgeParam =
              const fb.Int64Reader().vTableGetNullable(buffer, rootOffset, 6);
          final privacyParam = const fb.StringReader(asciiOptimization: true)
              .vTableGetNullable(buffer, rootOffset, 8);
          final noCacheParam =
              const fb.BoolReader().vTableGetNullable(buffer, rootOffset, 10);
          final noStoreParam =
              const fb.BoolReader().vTableGetNullable(buffer, rootOffset, 12);
          final otherParam = const fb.ListReader<String>(
                  fb.StringReader(asciiOptimization: true),
                  lazy: false)
              .vTableGetNullable(buffer, rootOffset, 14);
          final object = CacheControlBox(
              id: idParam,
              maxAge: maxAgeParam,
              privacy: privacyParam,
              noCache: noCacheParam,
              noStore: noStoreParam,
              other: otherParam)
            ..maxStale =
                const fb.Int64Reader().vTableGetNullable(buffer, rootOffset, 16)
            ..minFresh =
                const fb.Int64Reader().vTableGetNullable(buffer, rootOffset, 18)
            ..mustRevalidate =
                const fb.BoolReader().vTableGetNullable(buffer, rootOffset, 20);

          return object;
        }),
    CacheResponseBox: obx_int.EntityDefinition<CacheResponseBox>(
        model: _entities[2],
        toOneRelations: (CacheResponseBox object) => [object.cacheControl],
        toManyRelations: (CacheResponseBox object) => {},
        getId: (CacheResponseBox object) => object.id,
        setId: (CacheResponseBox object, int id) {
          object.id = id;
        },
        objectToFB: (CacheResponseBox object, fb.Builder fbb) {
          final keyOffset = fbb.writeString(object.key);
          final contentOffset = object.content == null
              ? null
              : fbb.writeListInt8(object.content!);
          final eTagOffset =
              object.eTag == null ? null : fbb.writeString(object.eTag!);
          final headersOffset = object.headers == null
              ? null
              : fbb.writeListInt8(object.headers!);
          final lastModifiedOffset = object.lastModified == null
              ? null
              : fbb.writeString(object.lastModified!);
          final urlOffset = fbb.writeString(object.url);
          fbb.startTable(15);
          fbb.addInt64(0, object.id ?? 0);
          fbb.addOffset(1, keyOffset);
          fbb.addOffset(2, contentOffset);
          fbb.addInt64(3, object.date?.millisecondsSinceEpoch);
          fbb.addOffset(4, eTagOffset);
          fbb.addInt64(5, object.expires?.millisecondsSinceEpoch);
          fbb.addOffset(6, headersOffset);
          fbb.addOffset(7, lastModifiedOffset);
          fbb.addInt64(8, object.maxStale?.millisecondsSinceEpoch);
          fbb.addInt64(9, object.responseDate.millisecondsSinceEpoch);
          fbb.addInt64(10, object.requestDate?.millisecondsSinceEpoch);
          fbb.addOffset(11, urlOffset);
          fbb.addInt64(12, object.priority);
          fbb.addInt64(13, object.cacheControl.targetId);
          fbb.finish(fbb.endTable());
          return object.id ?? 0;
        },
        objectFromFB: (obx.Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);
          final dateValue =
              const fb.Int64Reader().vTableGetNullable(buffer, rootOffset, 10);
          final expiresValue =
              const fb.Int64Reader().vTableGetNullable(buffer, rootOffset, 14);
          final maxStaleValue =
              const fb.Int64Reader().vTableGetNullable(buffer, rootOffset, 20);
          final requestDateValue =
              const fb.Int64Reader().vTableGetNullable(buffer, rootOffset, 24);
          final keyParam = const fb.StringReader(asciiOptimization: true)
              .vTableGet(buffer, rootOffset, 6, '');
          final contentParam =
              const fb.ListReader<int>(fb.Int8Reader(), lazy: false)
                  .vTableGetNullable(buffer, rootOffset, 8);
          final dateParam = dateValue == null
              ? null
              : DateTime.fromMillisecondsSinceEpoch(dateValue);
          final eTagParam = const fb.StringReader(asciiOptimization: true)
              .vTableGetNullable(buffer, rootOffset, 12);
          final expiresParam = expiresValue == null
              ? null
              : DateTime.fromMillisecondsSinceEpoch(expiresValue);
          final headersParam =
              const fb.ListReader<int>(fb.Int8Reader(), lazy: false)
                  .vTableGetNullable(buffer, rootOffset, 16);
          final lastModifiedParam =
              const fb.StringReader(asciiOptimization: true)
                  .vTableGetNullable(buffer, rootOffset, 18);
          final maxStaleParam = maxStaleValue == null
              ? null
              : DateTime.fromMillisecondsSinceEpoch(maxStaleValue);
          final requestDateParam = requestDateValue == null
              ? null
              : DateTime.fromMillisecondsSinceEpoch(requestDateValue);
          final priorityParam =
              const fb.Int64Reader().vTableGet(buffer, rootOffset, 28, 0);
          final responseDateParam = DateTime.fromMillisecondsSinceEpoch(
              const fb.Int64Reader().vTableGet(buffer, rootOffset, 22, 0));
          final urlParam = const fb.StringReader(asciiOptimization: true)
              .vTableGet(buffer, rootOffset, 26, '');
          final object = CacheResponseBox(
              key: keyParam,
              content: contentParam,
              date: dateParam,
              eTag: eTagParam,
              expires: expiresParam,
              headers: headersParam,
              lastModified: lastModifiedParam,
              maxStale: maxStaleParam,
              requestDate: requestDateParam,
              priority: priorityParam,
              responseDate: responseDateParam,
              url: urlParam)
            ..id =
                const fb.Int64Reader().vTableGetNullable(buffer, rootOffset, 4);
          object.cacheControl.targetId =
              const fb.Int64Reader().vTableGet(buffer, rootOffset, 30, 0);
          object.cacheControl.attach(store);
          return object;
        }),
    CacheResponse: obx_int.EntityDefinition<CacheResponse>(
        model: _entities[3],
        toOneRelations: (CacheResponse object) => [],
        toManyRelations: (CacheResponse object) => {},
        getId: (CacheResponse object) => object.id,
        setId: (CacheResponse object, int id) {
          object.id = id;
        },
        objectToFB: (CacheResponse object, fb.Builder fbb) {
          final keyOffset = fbb.writeString(object.key);
          final contentOffset = fbb.writeString(object.content);
          fbb.startTable(4);
          fbb.addInt64(0, object.id);
          fbb.addOffset(1, keyOffset);
          fbb.addOffset(2, contentOffset);
          fbb.finish(fbb.endTable());
          return object.id;
        },
        objectFromFB: (obx.Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);
          final idParam =
              const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0);
          final keyParam = const fb.StringReader(asciiOptimization: true)
              .vTableGet(buffer, rootOffset, 6, '');
          final contentParam = const fb.StringReader(asciiOptimization: true)
              .vTableGet(buffer, rootOffset, 8, '');
          final object =
              CacheResponse(id: idParam, key: keyParam, content: contentParam);

          return object;
        })
  };

  return obx_int.ModelDefinition(model, bindings);
}

/// [Site] entity fields to define ObjectBox queries.
class Site_ {
  /// See [Site.id].
  static final id = obx.QueryIntegerProperty<Site>(_entities[0].properties[0]);

  /// See [Site.remake].
  static final remake =
      obx.QueryStringProperty<Site>(_entities[0].properties[1]);

  /// See [Site.type].
  static final type = obx.QueryStringProperty<Site>(_entities[0].properties[2]);

  /// See [Site.serverId].
  static final serverId =
      obx.QueryStringProperty<Site>(_entities[0].properties[3]);

  /// See [Site.serverName].
  static final serverName =
      obx.QueryStringProperty<Site>(_entities[0].properties[4]);

  /// See [Site.version].
  static final version =
      obx.QueryStringProperty<Site>(_entities[0].properties[5]);

  /// See [Site.scheme].
  static final scheme =
      obx.QueryStringProperty<Site>(_entities[0].properties[6]);

  /// See [Site.host].
  static final host = obx.QueryStringProperty<Site>(_entities[0].properties[7]);

  /// See [Site.port].
  static final port =
      obx.QueryIntegerProperty<Site>(_entities[0].properties[8]);

  /// See [Site.userId].
  static final userId =
      obx.QueryStringProperty<Site>(_entities[0].properties[9]);

  /// See [Site.username].
  static final username =
      obx.QueryStringProperty<Site>(_entities[0].properties[10]);

  /// See [Site.password].
  static final password =
      obx.QueryStringProperty<Site>(_entities[0].properties[11]);

  /// See [Site.imageTag].
  static final imageTag =
      obx.QueryStringProperty<Site>(_entities[0].properties[12]);

  /// See [Site.accessToken].
  static final accessToken =
      obx.QueryStringProperty<Site>(_entities[0].properties[13]);
}

/// [CacheControlBox] entity fields to define ObjectBox queries.
class CacheControlBox_ {
  /// See [CacheControlBox.id].
  static final id =
      obx.QueryIntegerProperty<CacheControlBox>(_entities[1].properties[0]);

  /// See [CacheControlBox.maxAge].
  static final maxAge =
      obx.QueryIntegerProperty<CacheControlBox>(_entities[1].properties[1]);

  /// See [CacheControlBox.privacy].
  static final privacy =
      obx.QueryStringProperty<CacheControlBox>(_entities[1].properties[2]);

  /// See [CacheControlBox.noCache].
  static final noCache =
      obx.QueryBooleanProperty<CacheControlBox>(_entities[1].properties[3]);

  /// See [CacheControlBox.noStore].
  static final noStore =
      obx.QueryBooleanProperty<CacheControlBox>(_entities[1].properties[4]);

  /// See [CacheControlBox.other].
  static final other = obx.QueryStringVectorProperty<CacheControlBox>(
      _entities[1].properties[5]);

  /// See [CacheControlBox.maxStale].
  static final maxStale =
      obx.QueryIntegerProperty<CacheControlBox>(_entities[1].properties[6]);

  /// See [CacheControlBox.minFresh].
  static final minFresh =
      obx.QueryIntegerProperty<CacheControlBox>(_entities[1].properties[7]);

  /// See [CacheControlBox.mustRevalidate].
  static final mustRevalidate =
      obx.QueryBooleanProperty<CacheControlBox>(_entities[1].properties[8]);
}

/// [CacheResponseBox] entity fields to define ObjectBox queries.
class CacheResponseBox_ {
  /// See [CacheResponseBox.id].
  static final id =
      obx.QueryIntegerProperty<CacheResponseBox>(_entities[2].properties[0]);

  /// See [CacheResponseBox.key].
  static final key =
      obx.QueryStringProperty<CacheResponseBox>(_entities[2].properties[1]);

  /// See [CacheResponseBox.content].
  static final content =
      obx.QueryByteVectorProperty<CacheResponseBox>(_entities[2].properties[2]);

  /// See [CacheResponseBox.date].
  static final date =
      obx.QueryDateProperty<CacheResponseBox>(_entities[2].properties[3]);

  /// See [CacheResponseBox.eTag].
  static final eTag =
      obx.QueryStringProperty<CacheResponseBox>(_entities[2].properties[4]);

  /// See [CacheResponseBox.expires].
  static final expires =
      obx.QueryDateProperty<CacheResponseBox>(_entities[2].properties[5]);

  /// See [CacheResponseBox.headers].
  static final headers =
      obx.QueryByteVectorProperty<CacheResponseBox>(_entities[2].properties[6]);

  /// See [CacheResponseBox.lastModified].
  static final lastModified =
      obx.QueryStringProperty<CacheResponseBox>(_entities[2].properties[7]);

  /// See [CacheResponseBox.maxStale].
  static final maxStale =
      obx.QueryDateProperty<CacheResponseBox>(_entities[2].properties[8]);

  /// See [CacheResponseBox.responseDate].
  static final responseDate =
      obx.QueryDateProperty<CacheResponseBox>(_entities[2].properties[9]);

  /// See [CacheResponseBox.requestDate].
  static final requestDate =
      obx.QueryDateProperty<CacheResponseBox>(_entities[2].properties[10]);

  /// See [CacheResponseBox.url].
  static final url =
      obx.QueryStringProperty<CacheResponseBox>(_entities[2].properties[11]);

  /// See [CacheResponseBox.priority].
  static final priority =
      obx.QueryIntegerProperty<CacheResponseBox>(_entities[2].properties[12]);

  /// See [CacheResponseBox.cacheControl].
  static final cacheControl =
      obx.QueryRelationToOne<CacheResponseBox, CacheControlBox>(
          _entities[2].properties[13]);
}

/// [CacheResponse] entity fields to define ObjectBox queries.
class CacheResponse_ {
  /// See [CacheResponse.id].
  static final id =
      obx.QueryIntegerProperty<CacheResponse>(_entities[3].properties[0]);

  /// See [CacheResponse.key].
  static final key =
      obx.QueryStringProperty<CacheResponse>(_entities[3].properties[1]);

  /// See [CacheResponse.content].
  static final content =
      obx.QueryStringProperty<CacheResponse>(_entities[3].properties[2]);
}
