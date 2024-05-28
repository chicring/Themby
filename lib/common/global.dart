import 'package:shared_preferences/shared_preferences.dart';
import 'package:themby/common/helper/dio_helper.dart';
import 'package:uuid/uuid.dart';

import 'helper/objectBox_helper.dart';


//全局变量

late SharedPreferences prefs;

late DioHelper apiClient;

late ObjectboxHelper objectboxHelper;

late String deviceId;

late String deviceName;

late Uuid uuid;
