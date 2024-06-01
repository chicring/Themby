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
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('添加服务器'),
          content: Form(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Flex(
                  direction: Axis.horizontal,
                  children: [
                    Expanded(
                      flex: 1,
                      child: DropdownButtonFormField<String>(
                        value: state.schemeController.text.isEmpty ? null : state.schemeController.text,
                        decoration: InputDecoration(
                          labelText: '协议',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        items: <String>['http', 'https'].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          state.schemeController.text = newValue!;
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return '请选择协议';
                          }
                          return null;
                        },
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: TextFormField(
                        controller: state.portController,
                        decoration: InputDecoration(
                          labelText: '端口',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return '请输入端口';
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
                // ... 其他的 TextFormField
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
                if (Form.of(context).validate()) {
                  addServer();
                }
              },
              child: const Text('连接'),
            ),
          ],
        );
      },
    );
  }
}


