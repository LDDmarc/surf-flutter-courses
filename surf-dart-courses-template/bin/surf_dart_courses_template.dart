import 'dart:math';

import 'package:surf_dart_courses_template/surf_dart_courses_template.dart' as surf_dart_courses_template;

enum Days {
  monday, tuesday, wednesday, thursday, friday, saturday, sunday
}

void main(List<String> arguments) {
  var isTired = false;
  var day = Days.monday;

  while (true) {
    if (!isTired) {
        switch (day) {
          case Days.monday:
            work();
            gym();
          case Days.tuesday:
            englishLesson();
            work();
            badminton();
            isTired = true;
            continue;
          case Days.wednesday:
            pianoLesson();
            work();
          case Days.thursday:
            englishLesson();
            work();
            gym();
            isTired = true;
            continue;
          case Days.friday:
            work();
            badminton();
          case Days.saturday:
          case Days.sunday:
        }
        flutterLesson();
        dailyLeisure();
        isTired = true;
    } else {
      sleep();
      isTired = false;
    }
  }

}

void dailyLeisure() {
    if (Random().nextBool()) {
      do {
        hiking();
      } while (Random().nextBool());
    } else if (Random().nextBool()) {
      for (final film in ['film1', 'film2']) {
        films();
      }
    } else {
      videoGames();
    }
}

void sleep() {}

void work() {}
void englishLesson() {}
void pianoLesson() {}
void flutterLesson() {}

void gym() {}
void badminton() {}

void hiking() {}
void videoGames() {}
void films() {}