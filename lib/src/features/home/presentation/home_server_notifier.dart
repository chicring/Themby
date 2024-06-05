import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:themby/src/common/domiani/site.dart';
import 'package:themby/src/features/emby/application/emby_state_service.dart';
import 'package:themby/src/features/home/data/site_repository.dart';
import 'package:themby/src/features/home/domain/home_add_server_state.dart';

part 'home_server_notifier.g.dart';

@riverpod
class HomeServerNotifier extends _$HomeServerNotifier{

  @override
  HomeAddServerState build() => HomeAddServerState.initial();

  Future<void> openAddDialog() async {
    await SmartDialog.show(
      useSystem: true,
      builder: (context) {
        GlobalKey<FormState> formKey = GlobalKey<FormState>();
        return StatefulBuilder(builder: (context, StateSetter setState) {
          return AlertDialog(
            title: const Text('添加连接'),
            content: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: ListBody(
                  children: <Widget>[
                    DropdownMenu<String>(
                      label: const Text('协议'),
                      controller: state.schemeController,
                      inputDecorationTheme: InputDecorationTheme(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      dropdownMenuEntries: const [
                        DropdownMenuEntry(
                          value: 'http',
                          label: 'http',
                        ),
                        DropdownMenuEntry(
                          value: 'https',
                          label: 'https',
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: state.hostController,
                      decoration: InputDecoration(
                        labelText: 'Host',
                        hintText: 'Enter your host',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
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
                      controller: state.portController,
                      decoration: InputDecoration(
                        labelText: 'Port',
                        hintText: 'Enter the port',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a port';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: state.usernameController,
                      decoration: InputDecoration(
                        labelText: 'Username',
                        hintText: 'Enter your username',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
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
                        labelText: 'Password',
                        hintText: 'Enter your password',
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
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      obscureText: !state.isPasswordVisible,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: Text('Cancel'),
                onPressed: () {
                  SmartDialog.dismiss();
                },
              ),
              TextButton(
                child: Text('连接'),
                onPressed: (){
                  if (formKey.currentState!.validate()) {
                    ref.read(addEmbySiteProvider(site: Site(
                      scheme: state.schemeController.text,
                      host: state.hostController.text,
                      port: int.parse(state.portController.text),
                      username: state.usernameController.text,
                      password: state.passwordController.text,
                    )));
                  }
                },
              ),
            ],
          );
        });
      },
    );
  }
}


