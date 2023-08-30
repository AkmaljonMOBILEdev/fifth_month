import 'package:fifth_month/ui/auth_screen/auth_screen.dart';
import 'package:fifth_month/ui/counter_screen/counter_screen.dart';
import 'package:fifth_month/ui/log_out/log_out.dart';
import 'package:fifth_month/ui/math_screen/math_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TabBoxCubit extends Cubit<int>{
  TabBoxCubit():super(0);

  void changeIndex(int value)=>emit(value);

  final List<Widget> screens = [
    CounterScreen(),
    MathScreen(),
    LogOutScreen()
  ];

}