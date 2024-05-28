
import '../../objectbox.g.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

class ObjectboxHelper{

  late final Store store;

  ObjectboxHelper._create(this.store){

  }

  static Future<ObjectboxHelper> create() async {
    final directory = await getApplicationDocumentsDirectory();
    print('打印一下数据库地址==${directory.path}');
    final store = Store(getObjectBoxModel(), directory: join(directory.path, 'objectbox'));
    return ObjectboxHelper._create(store);
  }
}