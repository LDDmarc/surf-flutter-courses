import 'package:flutter/material.dart';

void main() {
  runApp(const SurfApp());
}

class SurfApp extends StatelessWidget {
  const SurfApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePageStateful(title: 'Counter v2.0'),
    );
  }
}

class HomePageStateful extends StatefulWidget {
  final String title;

  const HomePageStateful({required this.title, Key? key}) : super(key: key);

  @override
  State<HomePageStateful> createState() => _HomePageStatefulState();
}

class _HomePageStatefulState extends State<HomePageStateful> {
  int _counter = 0;
  int _plusButtonCounter = 0;
  int _minusButtonCounter = 0;

  void _incrementCounter() {
    setState(() {
      _plusButtonCounter += 1;
      _counter += 1;
    });
  }

  void _decrementCounter() {
    setState(() {
      _minusButtonCounter += 1;
      if (_counter == 0) { return; }
      _counter -= 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ResultWidget(text: 'Cuonter value:', value: _counter),
            const SizedBox(height: 20),
            ResultWidget(text: 'You have pushed + button this many times:', value: _plusButtonCounter),
            const SizedBox(height: 20),
            ResultWidget(text: 'You have pushed - button this many times:', value: _minusButtonCounter),
          ],
        ),
      ),
      bottomNavigationBar: CustomNavBar(
        onPlusTap: () {
          _incrementCounter();
        },
        onMinusTap: () {
          _decrementCounter();
        },
      ),
    );
  }
}

class CustomNavBar extends StatelessWidget {

  final Function() onPlusTap;
  final Function() onMinusTap;

  const CustomNavBar({
    required this.onPlusTap,
    required this.onMinusTap,
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: SafeArea(
        child: Row(
          children: [
            Expanded(
              child: IconButton(
                icon: Icon(Icons.remove),
                iconSize: 40,
                color: Colors.blue,
                onPressed: () { onMinusTap(); },
              ),
            ),
            Expanded(
              child: IconButton(
                icon: Icon(Icons.add),
                iconSize: 40,
                color: Colors.blue,
                onPressed: () { onPlusTap(); },
              ),
            ),
          ]
        ),
      ),
    );
  }
}

class ResultWidget extends StatelessWidget {

  final String text;
  final int value;

  const ResultWidget({super.key, required this.text, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(text),
          Text(
          '$value',
          style: Theme
              .of(context)
              .textTheme
              .headlineMedium
        ),
        ]
      )
    );
  }

}