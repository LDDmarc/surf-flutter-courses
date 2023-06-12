import 'dart:math';

import 'package:surf_dart_courses_template/surf_dart_courses_template.dart' as surf_dart_courses_template;

class Human {}

enum Strategy { a, b, c, custom }

extension ParseToString on Strategy {
  String toShortString() {
    return toString().split('.').last;
  }
}

abstract class BadmintonParticipant implements Human {

  late Strategy strategy;
  int get id;

  void register();

  void defend();
  void attack();

}

enum Sex { m, w }

extension ParseSexToString on Sex {
  String toShortString() {
    switch (this) {
      case Sex.m: return 'man';
      case Sex.w: return 'woman';
    }
  }
}

class BadmintonPlayer implements BadmintonParticipant {

  @override
  Strategy strategy;

  @override
  int get id => _id ?? -1;

  late int? _id;

  BadmintonPlayer(this.strategy) {
    register();
  }

  @override
  void register() {
    _id = Random().nextInt(100);
  }

  @override
  void attack() {
    // TODO: implement attack
  }

  @override
  void defend() {
    // TODO: implement defend
  }

  @override
  String toString() {
    return 'BadmintonPlayer. id: $id, strategy: ${strategy.toShortString()}';
  }

}

abstract class BadmintonMixPlayer extends BadmintonPlayer {

  late Sex sex;

  BadmintonMixPlayer(super.strategy);

  @override
  String toString() {
    return '${super.toString()}, sex: ${sex.toShortString()}';
  }
}

class BadmintonManPlayer extends BadmintonMixPlayer {
  @override
  final sex = Sex.m;

  BadmintonManPlayer(super.strategy);
}

class BadmintonWomanPlayer extends BadmintonMixPlayer {
  @override
  final sex = Sex.w;

  BadmintonWomanPlayer(super.strategy);
}

class BadmintonMixTeam {

  final BadmintonManPlayer manPlayer;
  final BadmintonWomanPlayer womanPlayer;

  BadmintonMixTeam({required this.manPlayer, required this.womanPlayer});

  void scorePoint() {}
  void startGame() {}
  void endGame() {}

  @override
  String toString() {
    return 'BadmintonMixTeam with players:\n$manPlayer\n$womanPlayer';
  }

}

void main(List<String> arguments) {
  final manPlayer = BadmintonManPlayer(Strategy.c);
  final womanPlayer = BadmintonWomanPlayer(Strategy.custom);
  final team = BadmintonMixTeam(manPlayer: manPlayer, womanPlayer: womanPlayer);
  print(team);
}
