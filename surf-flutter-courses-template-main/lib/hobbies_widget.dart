import 'package:flutter/material.dart';
import 'package:surf_flutter_courses_template/appearance.dart';

class HobbiesWidget extends StatelessWidget {
  final List<String> hobbies;

  const HobbiesWidget({super.key, required this.hobbies});

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              "Hobbies",
              style: Appearence.titleStyle,
            ),
          ),
          const SizedBox(height: 6),
          SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(children: [
                const SizedBox(width: 16),
                ...hobbies.map((e) => Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 4, 0),
                    child: HobbyWidget(hobbyName: e))),
                const SizedBox(width: 16),
              ]))
        ]);
  }
}

class HobbyWidget extends StatelessWidget {
  final String hobbyName;

  const HobbyWidget({super.key, required this.hobbyName});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6), color: Appearence.secondaryBackgroundColor),
      padding: const EdgeInsets.all(4),
      child: Text(
        hobbyName,
        style: Appearence.textStyle,
      ),
    );
  }
}
