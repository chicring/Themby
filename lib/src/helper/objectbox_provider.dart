import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:themby/objectbox.g.dart';

part 'objectbox_provider.g.dart';

@riverpod
Store store(StoreRef ref) {
  return throw UnimplementedError();
}

// @Riverpod(keepAlive: true)
// Future<Store> storeInit(StoreInitRef ref) async {
//   final directory = await getApplicationDocumentsDirectory();
//   print('打印一下数据库地址==${directory.path}');
//   final store = Store(getObjectBoxModel(), directory: join(directory.path, 'objectbox'));
//   return store;
// }