import 'package:flutter/material.dart';
import 'package:surf_flutter_courses_template/build_context_extension.dart';
import 'package:surf_flutter_courses_template/theme_settings_bottom_sheet.dart';
import 'theme/light_first_theme.dart';
import 'theme/theme_colors.dart';
import 'package:bottom_sheet/bottom_sheet.dart';
import 'app_theme.dart';
import 'theme_settings_bottom_sheet.dart';

class MainWidget extends StatefulWidget {
  const MainWidget({super.key});

  @override
  State<StatefulWidget> createState() => _MainWidgetState();
}

class _MainWidgetState extends State<StatefulWidget> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _makeAppBar(),
      body: Center(child: _makeBody()),
    );
  }

  AppBar _makeAppBar() {
    return AppBar(
      elevation: 0,
      title: const Text('Профиль'),
      leading: const BackButton(),
      actions: [
        TextButton(onPressed: () {}, child: const Text('Save'))
      ],
    );
  }

  Widget _makeBody() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const AvatarWidget(),
        const SizedBox(height: 24),
        const AwardsWidget(),
        const SizedBox(height: 24),
        Expanded(
            flex: 5,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
              child: _makeList(),
            )
        ),
        const Spacer(flex: 1),
        const LogoutButton(),
        const SizedBox(height: 24),
      ],
    );
  }

  Widget _makeList() {
    return ListView(
      children: [
        const RowWidget(
            title: 'Имя', subtitle: 'Маркус Хассельборг', onTap: null),
        const SizedBox(height: 8),
        const RowWidget(
            title: 'Email', subtitle: 'MarkusHSS@gmail.com', onTap: null),
        const SizedBox(height: 8),
        RowWidget(title: 'Команда', subtitle: 'Сборная Швеции', onTap: () {}),
        const SizedBox(height: 8),
        RowWidget(title: 'Позиция', subtitle: 'Скип', onTap: () {}),
        const SizedBox(height: 8),
        RowWidget(
            title: 'Тема оформления', subtitle: 'Системная', onTap: () {
          showFlexibleBottomSheet(
            initHeight: 0.6,
            minHeight: 0.6,
            bottomSheetColor: Colors.transparent,
            context: context,
            builder: _buildBottomSheet,
            isExpand: true,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0)
                ),
                color: Colors.white,
            ),
          );
        }),
      ],
    );
  }

  Widget _buildBottomSheet(
      BuildContext context,
      ScrollController scrollController,
      double bottomSheetOffset,
      ) {
    return ThemeSettingsBottomSheet(theme: AppTheme.system);
  }
}



// subwidgets

class RowWidget extends StatefulWidget {
  final VoidCallback? onTap;
  final String title;
  final String subtitle;

  const RowWidget({super.key, required this.title, required this.subtitle, required this.onTap});

  @override
  State<StatefulWidget> createState() => _RowWidgetState();
}

class _RowWidgetState extends State<RowWidget> {
  late VoidCallback? onTap;
  late String title;
  late String subtitle;

  @override
  void initState() {
    super.initState();
    onTap = widget.onTap;
    title = widget.title;
    subtitle = widget.subtitle;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          decoration: BoxDecoration(
            color: context.color.subviewColor,
            borderRadius: const BorderRadius.all(Radius.circular(16)),
          ),
          child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(title, style: context.textTheme.labelSmall),
                      Text(subtitle, style: context.textTheme.labelMedium)
                    ],
                  ),
                  const Spacer(),
                  Visibility(
                      visible: onTap != null,
                      child: const Icon(Icons.arrow_forward_ios)
                  )
                ],
              )
          )
      ),
    );
  }
}

class AvatarWidget extends StatelessWidget {
  const AvatarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        const CircleAvatar(
            radius: 40,
            backgroundImage: AssetImage('assets/moc_icon.png')
        ),
        TextButton(onPressed: (){}, child: const Text('Edit'))
      ],
    );
  }
}

class AwardsWidget extends StatelessWidget {
  const AwardsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final awards = ['assets/first_medal.png', 'assets/first_medal.png', 'assets/third_medal.png', 'assets/second_medal.png', 'assets/third_medal.png'];
    return Column(
      children: [
        Text('Мои награды', style: TextStyle(fontSize: 14, color: Color(0xFF77767B)) /*context.textTheme.labelSmall*/),
        const SizedBox(height: 12),
        Wrap(
          spacing: 16,
          children: awards.map((e) => Image(image: AssetImage(e), width: 32, height: 32)).toList(),
        )
      ],
    );
  }
}

class LogoutButton extends StatelessWidget {
  const LogoutButton({super.key});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: (){},
      style: ButtonStyle(
        shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0))),
      ),
      child: const Text("Log out"),
    );
  }
}