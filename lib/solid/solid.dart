import 'package:flutter/cupertino.dart';

/// Single Responsibility Principe
class UserProfile{
  final String email;
  final String password;
  UserProfile({required this.email, required this.password});
}

class UserProfileDatabase{
  void saveUserData(UserProfile user){
    // save user data in Local Database
  }
}

class UserConfirmationByEmail{
  void sendCodeToEmail(UserProfile user){
    // send confirmation code to the email of the user
  }
}

/// Open/Clothed Principe

abstract class Vehicle{
  final int wheelCount;
  final int speed;
  final int fuelConsumption;
  Vehicle({required this.wheelCount, required this.speed, required this.fuelConsumption,});

  void start(){}
  void stop(){}
}
class Car extends Vehicle{
  Car({required super.wheelCount, required super.speed, required super.fuelConsumption});

  @override
  void start() {
    debugPrint("Car is running faster!");
    super.start();
  }
  @override
  void stop() {
    debugPrint("Car can stops immediately!");
    super.stop();
  }

  void drift(){
    debugPrint("The car is able to drift suddenly!");
  }

}
class MotorCycle extends Vehicle{
  MotorCycle({required super.wheelCount, required super.speed, required super.fuelConsumption});

  @override
  void start() {
    debugPrint("The motor is easier runnable vehicle");
    super.start();
  }

  @override
  void stop() {
    debugPrint("Stopping the motor");
    super.stop();
  }

}

/// Liskov Substitution
class Animal{
  void run(){
    debugPrint("Any animal can run");
  }
}
class Fish extends Animal{
  @override
  void run() {
    debugPrint("Fish can't run, but swim");
    super.run();
  }
}

/// Interface Segregation
/// mistake way
abstract class Worker{
  void work(){}
  void clean(){}
  void count(){}
}
class Accountant implements Worker{
  @override
  void clean() {
    // TODO: implement clean
  }

  @override
  void count() {
    // TODO: implement count
  }

  @override
  void work() {
    // TODO: implement work
  }
}
class Cleaner implements Worker{
  @override
  void clean() {
    // TODO: implement clean
  }

  @override
  void count() {
    // TODO: implement count
  }

  @override
  void work() {
    // TODO: implement work
  }
}
class Programmer implements Worker{
  @override
  void clean() {
    // TODO: implement clean
  }

  @override
  void count() {
    // TODO: implement count
  }

  @override
  void work() {
    // TODO: implement work
  }

}
/// correct way
abstract class Workable{
  void work(){}
}
abstract class Cleanable{
  void clean(){}
}
abstract class Countable{
  void count(){}
}
class RealProgrammer implements Workable{
  @override
  void work() {
    // TODO: implement work
  }

}
class RealCleaner implements Cleanable{
  @override
  void clean() {
    // TODO: implement clean
  }
}
class RealAccountant implements Countable{
  @override
  void count() {
    // TODO: implement count
  }
}



