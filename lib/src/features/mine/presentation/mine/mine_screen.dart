
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:themby/src/localization/string_hardcoded.dart';

class MineScreen extends StatelessWidget {
  const MineScreen({super.key});

  @override
  Widget build(BuildContext context) {

    var color = Theme.of(context).colorScheme.primary;

    return Scaffold(
        appBar: AppBar(
          title: Text(
              "我的".hardcoded,
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: color
              )
          ),
        ),
        body: Container(
          margin: const EdgeInsets.all(15),
          child: Column(
            children: <Widget>[
              Card(
                clipBehavior: Clip.antiAlias,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: ListView(
                    shrinkWrap: true,
                    children: [
                      ListTile(
                        enabled: false,
                        visualDensity: const VisualDensity(vertical: -4.0),
                        title: Text(
                            "通用".hardcoded,
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: color
                            )
                        ),
                      ),
                      ListTile(
                        title: Text("通用设置".hardcoded),
                        onTap: () {
                          GoRouter.of(context).push('/app_setting');
                        },
                      ),
                    ],
                )
              ),
            ],
          ),
        )
    );
  }
}

