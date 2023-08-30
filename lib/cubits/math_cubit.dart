import 'dart:math';

import 'package:fifth_month/data/models/math_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MathCubit extends Cubit<MathModel>{
  MathCubit():super(MathModel()){
    countResult();
  }
  num theResult = 0;
  void updateFirst(int value){
    emit(state.copyWith(a: value));
  }

  void updateSecond(int value){
    emit(state.copyWith(b: value));
  }


  num countResult(){
    if(state.a!=0 && state.b!=0){
      theResult = pow(state.a, state.b);
      return theResult;
    }
    return 0;
  }

  void setZero(){
    theResult=0;
  }

}