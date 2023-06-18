import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MainApp());
}

const double itemWidth = 180;

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 0),
                child: StackWidget(),
              )
          ),
        ),
      ),
    );
  }

}

class StackWidget extends StatefulWidget {
  const StackWidget({super.key});

  @override
  State<StatefulWidget> createState() {
    return StackWidgetState();
  }
}

class StackWidgetState extends State<StackWidget> with TickerProviderStateMixin {

  double _xPosition = 100;
  double _yPosition = 200;

  Color _color = Colors.amber;

  BuildContext? _context;

  late final AnimationController _animationController;
  late final Animation<double> _animation;

  @override
  void initState() {
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _animation = Tween(begin: 0.0, end: 0.25).animate(_animationController);
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _context = context;
    return Stack(
        children: [
          Positioned(
              left: _xPosition,
              top: _yPosition,
              child: RotationTransition(
                turns: _animation,
                child: AnimatedContainer(
                    color: _color,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeInOut,
                    child: const MyWidget(),
                    ),
                )
          ),
          Positioned.fill(
              child: GestureDetector(
                onPanUpdate: _onPanUpdate,
                onTap: _onTap,
                onLongPress: _onLongTap,
              )
          )
        ]
    );
  }

  void _onPanUpdate(DragUpdateDetails details) {
    setState(() {
      final canMoveLeft = !(_xPosition < 1 && details.delta.dx < 0);
      final canMoveRight = !((_xPosition + itemWidth) > _context!.size!.width && details.delta.dx > 0);
      if (canMoveRight && canMoveLeft) {
        _xPosition += details.delta.dx;
      }

      final canMoveUp = !(_yPosition < 1 && details.delta.dy < 0);
      final canMoveDown = !((_yPosition + itemWidth) > _context!.size!.height && details.delta.dy > 0);
      if (canMoveUp && canMoveDown) {
        _yPosition += details.delta.dy;
      }
    });
  }

  void _onTap() {
    var generatedColor = Random().nextInt(Colors.primaries.length);
    setState(() {
      _color = Colors.primaries[generatedColor];
    });
  }

  void _onLongTap() {
    _animationController.reset();
    _animationController.forward();
  }
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox.square(dimension: itemWidth);
  }
}
