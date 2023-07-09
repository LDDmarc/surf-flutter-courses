import 'package:flutter/material.dart';
import 'appearance.dart';
import 'hobbies_widget.dart';
import 'avatar_widget.dart';
import 'info_widget.dart';
import 'mock_data.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
          elevation: 0,
          title: const Text(
            'Visit card',
            style: Appearence.titleStyle,
          ),
          backgroundColor: Appearence.backgroundColor),
      body: const Column(
        children: [
          SizedBox(height: 16),
          Center(
            child: AvatarWidget(assetName: MockData.avatar),
          ),
          SizedBox(height: 16),
          Center(
            child: Text(
              MockData.name,
              style: Appearence.titleStyle,
            ),
          ),
          SizedBox(height: 4),
          Center(
            child: Text(
              MockData.role,
              style: Appearence.secondaryTextStyle,
            ),
          ),
          SizedBox(height: 16),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Align(
                alignment: Alignment.topLeft,
                child: InfoWidget(
                    title: 'About', description: MockData.aboutText)),
          ),
          SizedBox(height: 24),
          Align(
              alignment: Alignment.topLeft,
              child: HobbiesWidget(hobbies: MockData.hobbies)),
          SizedBox(height: 24),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Align(
                  alignment: Alignment.topLeft,
                  child: InfoWidget(
                      title: 'Experience', description: MockData.experience))),
        ],
      ),
      backgroundColor: Appearence.backgroundColor,
    ));
  }
}
