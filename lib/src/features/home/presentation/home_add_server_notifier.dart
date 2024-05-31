import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:themby/src/features/home/domain/home_add_server_state.dart';

part 'home_add_server_notifier.g.dart';

@riverpod
class HomeAddServerNotifier extends _$HomeAddServerNotifier{

  @override
  HomeAddServerState build() => HomeAddServerState.initial();

  void addServer() {

  }


  Future<void> openAddDialog() async {
    await SmartDialog.show(
        useSystem: true,
        animationType: SmartAnimationType.centerFade_otherSlide,
        builder: (BuildContext context){
          return AlertDialog(
            title: const Text('添加服务器'),
            content: Form(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextFormField(
                    controller: state.hostController,
                    decoration: const InputDecoration(
                      labelText: '主机',
                    ),
                  ),
                  TextFormField(
                    controller: state.portController,
                    decoration: const InputDecoration(
                      labelText: '端口',
                    ),
                  ),
                  TextFormField(
                    controller: state.usernameController,
                    decoration: const InputDecoration(
                      labelText: '用户名',
                    ),
                  ),
                  TextFormField(
                    controller: state.passwordController,
                    decoration: const InputDecoration(
                      labelText: '密码',
                    ),
                  ),
                ],
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  SmartDialog.dismiss();
                },
                child: const Text('取消'),
              ),
              TextButton(
                onPressed: () {
                  addServer();
                },
                child: const Text('连接'),
              ),
            ],
          );
        }
    );
  }
}


