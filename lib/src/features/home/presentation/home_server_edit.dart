

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:flutter_svg/svg.dart';
import 'package:themby/src/common/constants.dart';
import 'package:themby/src/common/domiani/site.dart';
import 'package:themby/src/features/home/data/site_repository.dart';

class HomeServerEdit extends ConsumerStatefulWidget{
  const HomeServerEdit({super.key,required this.site});

  final Site site;

  @override
  ConsumerState<HomeServerEdit> createState() => _HomeAddState();
}


class _HomeAddState extends ConsumerState<HomeServerEdit> {

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  late final TextEditingController remakeController;
  late final TextEditingController schemeController;
  late final TextEditingController hostController;
  late final TextEditingController portController;
  late final TextEditingController usernameController;
  late final TextEditingController passwordController;

  @override
  void initState(){
    super.initState();
    remakeController = TextEditingController(text: widget.site.remake);
    schemeController = TextEditingController(text: widget.site.scheme);
    hostController = TextEditingController(text: widget.site.host);
    portController = TextEditingController(text: widget.site.port.toString());
    usernameController = TextEditingController(text: widget.site.username);
    passwordController = TextEditingController(text: widget.site.password);
  }

  @override
  void dispose(){
    schemeController.dispose();
    hostController.dispose();
    portController.dispose();
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
        title: const Text('编辑',style: StyleString.headerStyle),
      ),
      body: Container(
        alignment: Alignment.center,
        constraints: const BoxConstraints(
          maxWidth: 500,
        ),
        margin: const EdgeInsets.all(12),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
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
                      controller: remakeController,
                      decoration: InputDecoration(
                        labelText: '站点备注',
                        prefixIcon: const Icon(Icons.info_outline_rounded),
                        border: OutlineInputBorder(
                          borderRadius: StyleString.lgRadius,
                        ),
                      ),
                      keyboardType: TextInputType.text,
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: schemeController,
                      decoration: InputDecoration(
                        labelText: '协议',
                        hintText: 'http / https',
                        prefixIcon: const Icon(Icons.dns_rounded),
                        border: OutlineInputBorder(
                          borderRadius: StyleString.lgRadius,
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter scheme';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: hostController,
                      decoration: InputDecoration(
                        labelText: '站点地址',
                        hintText: 'http / https',
                        prefixIcon: const Icon(Icons.dns_rounded),
                        border: OutlineInputBorder(
                          borderRadius: StyleString.lgRadius,
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter scheme';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: portController,
                      decoration: InputDecoration(
                        labelText: '端口',
                        hintText: 'Enter your 端口',
                        prefixIcon: const Icon(Icons.portable_wifi_off_rounded),
                        border: OutlineInputBorder(
                          borderRadius: StyleString.lgRadius,
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your port';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: usernameController,
                      decoration: InputDecoration(
                        labelText: '用户名',
                        hintText: 'Enter your username',
                        prefixIcon: const Icon(Icons.person_rounded),
                        border: OutlineInputBorder(
                          borderRadius: StyleString.lgRadius,
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your port';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: passwordController,
                      decoration: InputDecoration(
                        labelText: '密码',
                        hintText: 'Enter your 密码',
                        prefixIcon: const Icon(Icons.password_rounded),
                        border: OutlineInputBorder(
                          borderRadius: StyleString.lgRadius,
                        ),
                      ),
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
                  child: const Text('修改'),
                  onPressed: () async{
                    if (formKey.currentState!.validate()) {
                      SmartDialog.showLoading();
                      Site newSite = widget.site.copyWith(
                        remake: remakeController.text,
                        scheme: schemeController.text,
                        host: hostController.text,
                        port: int.parse(portController.text),
                        username: usernameController.text,
                        password: passwordController.text,
                      );

                      ref.read(updateEmbySiteProvider(site: newSite).future).then((v) {
                        SmartDialog.showToast('修改成功');
                        ref.refresh(finaAllByTextProvider(text: ''));
                        SmartDialog.dismiss();
                      });
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