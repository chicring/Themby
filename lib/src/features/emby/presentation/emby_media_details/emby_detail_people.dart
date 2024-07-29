

import 'package:flutter/material.dart';
import 'package:themby/src/common/constants.dart';
import 'package:themby/src/features/emby/domain/emby/person.dart';
import 'package:themby/src/features/emby/presentation/widgets/people_card.dart';
import 'package:themby/src/helper/screen_helper.dart';

class DetailPeople extends StatelessWidget {
  final List<Person> people;
  const DetailPeople({super.key, required this.people});

  @override
  Widget build(BuildContext context) {

    double cardWidth = ScreenHelper.getPortionAuto();
    double cardHeight = cardWidth / 0.65;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Row(
          children: [
            SizedBox(width: StyleString.safeSpace),
            Text(
              '演员',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const SizedBox(height: StyleString.safeSpace),
        Stack(
          children: [
            IgnorePointer(
              child: Opacity(
                opacity: 0.0,
                child: Column(
                  children: [
                    Container(
                      width: cardWidth,
                      margin: const EdgeInsets.only(
                        left: StyleString.safeSpace,
                      ),
                      child: PeopleCard(
                        person: people.first,
                        width: cardWidth,
                        height: cardHeight,
                      ),
                    ),
                    const SizedBox(height: 1),
                  ],
                ),
              ),
            ),
            const SizedBox(width: double.infinity),
            Positioned.fill(
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: people.length,
                  padding: const EdgeInsets.only(right: StyleString.safeSpace),
                  itemBuilder: (context, index) {
                    return Container(
                      padding: const EdgeInsets.only(left: StyleString.safeSpace),
                      child: PeopleCard(
                        person: people[index],
                        width: cardWidth,
                        height: cardHeight,
                      ),
                    );
                  },
                )
            )
          ],
        ),
      ],
    );
  }
}