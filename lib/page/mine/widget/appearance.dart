import 'package:flutter/material.dart';

import '../../../generated/l10n.dart';


class AppearanceWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
            S.of(context).appearance,
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.w100)
        ),
        ListTile(
          title: Text('Theme'),
          subtitle: Text('Light'),
          onTap: () {
            Navigator.pushNamed(context, '/theme');
          },
        ),
        ListTile(
          title: Text('Language'),
          subtitle: Text('English'),
          onTap: () {
            Navigator.pushNamed(context, '/language');
          },
        ),
      ],
    );
  }
}