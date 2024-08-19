import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'cache_setting.g.dart';

class CacheSetting{

  /// 获取缓存目录并计算缓存大小
  Future<String> getCacheSize() async {
    double cacheSize = 0;
    Directory tempDirectory = await getTemporaryDirectory();
    Directory docDirectory = await getApplicationDocumentsDirectory();

    if (tempDirectory.existsSync()) {
      cacheSize += await calculateDirectorySize(tempDirectory);
    }

    if (docDirectory.existsSync()) {
      String dioCacheFileName = '${docDirectory.path}${Platform.pathSeparator}DioCache.db';
      File dioCacheFile = File(dioCacheFileName);
      if (dioCacheFile.existsSync()) {
        cacheSize += await calculateDirectorySize(dioCacheFile);
      }
    }

    return formatSize(cacheSize);
  }

  /// 递归计算文件或目录的大小
  Future<double> calculateDirectorySize(FileSystemEntity file) async {
    if (file is File) {
      return file.lengthSync().toDouble();
    }
    if (file is Directory) {
      double totalSize = 0;
      await for (FileSystemEntity entity in file.list()) {
        totalSize += await calculateDirectorySize(entity);
      }
      return totalSize;
    }
    return 0;
  }

  /// 格式化文件大小
  String formatSize(double size) {
    const units = ['B', 'KB', 'MB', 'GB'];
    int index = 0;
    while (size > 1024 && index < units.length - 1) {
      size /= 1024;
      index++;
    }
    return '${size.toStringAsFixed(2)} ${units[index]}';
  }

  /// 清除所有缓存
  Future<bool> clearAllCache() async {
    return await SmartDialog.show(
      useSystem: true,
      animationType: SmartAnimationType.centerFade_otherSlide,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('提示'),
          content: const Text('该操作将清除图片缓存数据，是否继续'),
          actions: [
            TextButton(
              onPressed: () => SmartDialog.dismiss(),
              child: const Text('取消'),
            ),
            TextButton(
              onPressed: () async {
                SmartDialog.dismiss();
                SmartDialog.showLoading(msg: '正在清除...');
                try {
                  // await clearDioCache();
                  await clearLibraryCache();
                  Timer(const Duration(milliseconds: 500), () {
                    SmartDialog.dismiss().then((_) {
                      SmartDialog.showToast('清除完成 ✅');
                    });
                  });
                } catch (err) {
                  SmartDialog.dismiss();
                  SmartDialog.showToast(err.toString());
                }
              },
              child: const Text('继续'),
            ),
          ],
        );
      },
    ).then((_) => true);
  }

  /// 清除 Documents 目录下的 DioCache.db
  Future<void> clearDioCache() async {
    Directory directory = await getApplicationDocumentsDirectory();
    if (directory.existsSync()) {
      String dioCacheFileName = '${directory.path}${Platform.pathSeparator}DioCache.db';
      File dioCacheFile = File(dioCacheFileName);
      if (dioCacheFile.existsSync()) {
        await dioCacheFile.delete();
      }
    }
  }

  /// 清除 Library/Caches 目录及文件缓存
  Future<void> clearLibraryCache() async {
    Directory tempDirectory = await getTemporaryDirectory();
    if (tempDirectory.existsSync()) {
      await tempDirectory.delete(recursive: true);
    }
  }

  /// 递归删除目录及文件
  Future<void> deleteDirectory(FileSystemEntity file) async {
    if (file is Directory) {
      await for (FileSystemEntity entity in file.list()) {
        await deleteDirectory(entity);
      }
    }
    await file.delete();
  }
}

@riverpod
CacheSetting cacheSetting(CacheSettingRef ref){
  return CacheSetting();
}