import 'package:flutter/material.dart';

import '../../../generated/l10n.dart';

class AccountWidget extends StatelessWidget {
  const AccountWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const CircleAvatar(
                radius: 30,
                child: Icon(Icons.person_rounded),
              ),
              SizedBox(width: 10), // Add this line
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text('账号'),
                  Text('1234567890'),
                ],
              ),
            ],
          ),
          Column(
            children:  [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation: 0,

                ),
                onPressed: () {

                },
                child: Text(S.of(context).vip),
              ),
            ],
          )
        ],
      ),
    );
  }
}