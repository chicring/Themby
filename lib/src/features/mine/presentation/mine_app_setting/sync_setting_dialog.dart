import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:themby/src/common/constants.dart';
import 'package:themby/src/common/data/sync_setting.dart';
import 'package:themby/src/features/mine/widgets/label_text.dart';

class SyncSettingDialog extends ConsumerStatefulWidget {
  const SyncSettingDialog({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SyncSettingScreenState();
}

class _SyncSettingScreenState extends ConsumerState<SyncSettingDialog> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  late final TextEditingController urlController;
  late final TextEditingController usernameController;
  late final TextEditingController passwordController;

  @override
  void initState() {
    super.initState();
    urlController = TextEditingController(text: ref.read(syncSettingProvider).syncWebdavUrl);
    usernameController = TextEditingController(text: ref.read(syncSettingProvider).syncWebdavUsername);
    passwordController = TextEditingController(text: ref.read(syncSettingProvider).syncWebdavPassword);
  }

  @override
  void dispose() {
    urlController.dispose();
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              SmartDialog.dismiss();
            },
          ),
          title: const Text('WebDav配置'),
          titleSpacing: 0.0,
        ),
        body: Container(
          alignment: Alignment.topCenter,
          constraints: const BoxConstraints(
            maxWidth: 500,
          ),
          margin: const EdgeInsets.all(12),
          child: SingleChildScrollView(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    child: Icon(
                      Icons.cloud_circle_outlined,
                      size: 100,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Form(
                      key: formKey,
                      child: Column(
                        children: [
                          TextFormField(
                            controller: urlController,
                            decoration: InputDecoration(
                              labelText: '主机地址',
                              hintText: 'https://example.com',
                              border: OutlineInputBorder(
                                borderRadius: StyleString.lgRadius,
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return '请输入主机地址';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 10),
                          TextFormField(

                            controller: usernameController,
                            decoration: InputDecoration(
                              labelText: '用户名',
                              hintText: 'username',
                              border: OutlineInputBorder(
                                borderRadius: StyleString.lgRadius,
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return '请输入用户名';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 10),
                          TextFormField(
                            controller: passwordController,
                            decoration: InputDecoration(
                              labelText: '密码',
                              hintText: 'password',
                              border: OutlineInputBorder(
                                borderRadius: StyleString.lgRadius,
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return '请输入密码';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 10),
                          SizedBox(
                            width: double.infinity,
                            child: MaterialButton(
                              height: 50,
                              elevation: 0,
                              color: Theme.of(context).colorScheme.primary,
                              textColor: Theme.of(context).colorScheme.onPrimary,
                              shape: RoundedRectangleBorder(
                                borderRadius: StyleString.lgRadius,
                              ),
                              child: const Text('连接'),
                              onPressed: () async{
                                if (formKey.currentState!.validate()) {
                                  ref.read(syncSettingProvider).setSyncWebdav(
                                      urlController.text,
                                      usernameController.text,
                                      passwordController.text
                                  );
                                  ref.invalidate(syncSettingProvider);
                                  SmartDialog.showToast("添加成功");
                                  SmartDialog.dismiss();
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ]
            ),
          ),
        )
    );
  }
}

