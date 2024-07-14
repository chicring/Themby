

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:flutter_svg/svg.dart';
import 'package:themby/src/common/constants.dart';
import 'package:themby/src/common/domiani/site.dart';
import 'package:themby/src/features/home/data/site_repository.dart';
import 'package:themby/src/features/home/presentation/home_server_notifier.dart';

class HomeAddSite extends ConsumerStatefulWidget{
  const HomeAddSite({super.key});

  @override
  ConsumerState<HomeAddSite> createState() => _HomeAddState();
}


class _HomeAddState extends ConsumerState<HomeAddSite> {

  GlobalKey<FormState> formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {

    final state = ref.watch(homeServerNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            SmartDialog.dismiss();
          },
        ),
        title: const Text('添加连接',style: StyleString.headerStyle),
      ),
      body: Container(
        constraints: const BoxConstraints(
          maxWidth: 500,
        ),
        margin: const EdgeInsets.all(12),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                  child: SvgPicture.asset(
                    'assets/emby.svg',
                    width: 60,
                  )
              ),
              const SizedBox(height: 30),
              Form(
                key: formKey,
                child: ListBody(
                  children: [
                    TextFormField(
                      controller: state.hostController,
                      decoration: InputDecoration(
                        labelText: '服务器地址',
                        hintText: '例如: http(s)://example.com',
                        prefixIcon: const Icon(Icons.dns_rounded),
                        border: OutlineInputBorder(
                          borderRadius: StyleString.lgRadius,
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a host';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: state.usernameController,
                      decoration: InputDecoration(
                        labelText: '用户名',
                        hintText: 'Enter your username',
                        prefixIcon: const Icon(Icons.account_circle_rounded),
                        border: OutlineInputBorder(
                          borderRadius: StyleString.lgRadius,
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your username';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: state.passwordController,
                      decoration: InputDecoration(
                        labelText: '密码',
                        hintText: 'Enter your password',
                        prefixIcon: const Icon(Icons.password_rounded),
                        suffixIcon: IconButton(
                          icon: Icon(
                            state.isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                          ),
                          onPressed: () {
                            setState(() {
                              state.isPasswordVisible = !state.isPasswordVisible;
                            });
                          },
                        ),
                        border: OutlineInputBorder(
                          borderRadius: StyleString.lgRadius,
                        ),
                      ),
                      obscureText: !state.isPasswordVisible,
                    ),
                  ],
                ),
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
                      SmartDialog.showLoading();

                      Uri uri = Uri.parse(state.hostController.text);

                      await ref.read(addEmbySiteProvider(site: Site(
                        scheme: uri.scheme,
                        host: uri.host,
                        port: uri.port,
                        username: state.usernameController.text,
                        password: state.passwordController.text,
                      )).future);
                      await ref.refresh(getSitesProvider.future);

                      await SmartDialog.showToast('添加成功');
                      SmartDialog.dismiss();
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}