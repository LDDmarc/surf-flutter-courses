import 'dart:ffi';
import 'dart:async';

import 'package:surf_dart_courses_template/surf_dart_courses_template.dart' as surf_dart_courses_template;

abstract class KitchenHelper {

  void makePancakes();
  void doDishes();

}

class Battery {

  int _charge = 100;
  int get charge => _charge;

  final int deadTime;

  // Constructor
  Battery({required this.deadTime}) {
    Timer.periodic(Duration(seconds: deadTime), (Timer t) => {
      if (_charge > 0) { _charge -= 1 }
    });
  }

  Future<bool> recharge() {
    return Future.delayed(const Duration(seconds: 2), () {
      _charge = 100;
      return true;
    });
  }

}

class KitchenRobot_1000 extends KitchenHelper {

  static const _company = 'KitchenRobot';

  final deadTime = 2;
  final model = '1000';
  final description = 'Modern technology that allows you to take a break from your home routine and enjoy the taste and purity';

  late final Battery battery;
  String? name;

  int _numberOfUsers;
  int _charge = 100;

  // Constructor
  KitchenRobot_1000({required numberOfUsers}) :
        _numberOfUsers = numberOfUsers {
    battery = Battery(deadTime: deadTime);
  }

  KitchenRobot_1000.standard() : this(numberOfUsers: 4);

  // Setter
  set numberOfUsers(int newValue) {
    _numberOfUsers = newValue;
  }

  // KitchenHelper
  @override
  void makePancakes() {
      print('Make $_numberOfUsers tasty pancakes');
  }

  @override
  void doDishes() {
    print('Do dishes');
  }

  Future<bool> recharge() async {
    return await battery.recharge();
  }

  // Internal
  @override
  String toString() {
    var result = '$_company $model \n$description';
    if (name != null) {
      result += '\nName: $name';
    }
    return result;
  }

}

class KitchenRobot_2000 extends KitchenRobot_1000 {

  @override
  final deadTime = 6;
  @override
  final model = '2000';
  @override
  final description = 'The best technology that allows you to enjoy the taste and purity longer then ever';

  KitchenRobot_2000({required super.numberOfUsers});

  @override
  void makePancakes() {
    print('Make $_numberOfUsers delicious pancakes with honey');
  }

}

void main(List<String> arguments) {
  final robot1 = KitchenRobot_1000.standard();
  print(robot1);
  robot1.makePancakes();
  final robot2 = KitchenRobot_2000(numberOfUsers: 2);
  print(robot2);
  robot2.makePancakes();

  Future.delayed(const Duration(seconds: 10), () {
    print('Battery charge after 10 sec:');
    print('robot1: $robot1.battery.charge');
    print('robot2: $robot2.battery.charge');
  });
}
