import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:themby/page/mine/widget/account.dart';


import '../../generated/l10n.dart';


class MinePage extends StatelessWidget {
  const MinePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.all(15),
        child: Column(
          children: <Widget>[
            AccountWidget(),

            const SizedBox(height: 20),

            _buildCard(context)
          ],
        ),
      )
    );
  }

  Widget _buildCard(BuildContext context) {

    var color = Theme.of(context).colorScheme.primary;

    return Card(
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
            visualDensity: VisualDensity(vertical: -4.0),
            title: Text(
                S.of(context).appearance,
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: color
                )
            ),
          ),
          ListTile(
            title: Text(S.of(context).appearanceSetting),
            onTap: () {
              GoRouter.of(context).push('/appearance');
            },
          ),
          ListTile(
            enabled: false,
            visualDensity: VisualDensity(vertical: -4.0),
            title: Text(
                "播放器",
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: color
                )
            ),
          ),
        ],
      ),
    );
  }
}