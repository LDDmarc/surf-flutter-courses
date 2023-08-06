import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: Scaffold(
        appBar: _makeAppBar(),
        body: Center(child: _makeBody()),
      ),
    );
  }

  AppBar _makeAppBar() {
    return AppBar(
      elevation: 0,
      title: const Text('Профиль'),
      leading: const BackButton(),
      actions: [
        TextButton(onPressed: (){}, child: const Text('Save'))
      ],
    );
  }

  Widget _makeBody() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _makeAvatar(),
        const SizedBox(height: 24),
        _makeAwardsWidget(),
        const SizedBox(height: 24),
        Expanded(flex: 2, child: _makeList()),
        const Spacer(),
        _makeLogoutButton(),
        const SizedBox(height: 24),
      ],
    );
  }

  Widget _makeAvatar() {
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

  Widget _makeAwardsWidget() {
    final awards = ['assets/first_medal.png', 'assets/first_medal.png', 'assets/third_medal.png', 'assets/second_medal.png', 'assets/third_medal.png'];
    return Column(
      children: [
        const Text('Мои награды'),
        const SizedBox(height: 12),
        Wrap(
          spacing: 16,
          children: awards.map((e) => Image(image: AssetImage(e), width: 32, height: 32)).toList(),
        )
      ],
    );
  }

  Widget _makeRow({required String title, required String subtitle, void Function()? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          decoration: const BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(16)),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title),
                    Text(subtitle)
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

  Widget _makeList() {
    return ListView(
      children: [
        _makeRow(title: 'Имя', subtitle: 'Маркус Хассельборг'),
        _makeRow(title: 'Email', subtitle: 'MarkusHSS@gmail.com'),
        _makeRow(title: 'Команда', subtitle: 'Сборная Швеции', onTap: (){}),
        _makeRow(title: 'Позиция', subtitle: 'Скип', onTap: (){}),
        _makeRow(title: 'Тема оформления', subtitle: 'Системная', onTap: (){}),
      ],
    );
  }

  Widget _makeLogoutButton() {
    return OutlinedButton(
      onPressed: (){},
      style: ButtonStyle(
        shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0))),
      ),
      child: const Text("Log out"),
    );
  }
}
