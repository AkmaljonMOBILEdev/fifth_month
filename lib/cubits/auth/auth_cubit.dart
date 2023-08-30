import 'package:fifth_month/cubits/auth/auth_state.dart';
import 'package:fifth_month/data/firebase/firebase_service.dart';
import 'package:fifth_month/ui/auth_screen/auth_screen.dart';
import 'package:fifth_month/ui/home_screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/universal_data.dart';
import '../../utils/ui_utils/error_message_dialog.dart';
import '../../utils/ui_utils/loading_dialog.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit({required this.fireBaseService}) :super(InitialAuthState());
  final FireBaseService fireBaseService;

  Future<void> signUp(
      {required BuildContext context, required String username, required String email, required String password,}) async {
    showLoading(context: context);

    UniversalData data = await fireBaseService.signUp(
        name: username,
        email: email, password: password);
    if (context.mounted) hideLoading(context: context);
    if (data.error.isEmpty) {
      if (context.mounted) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => HomeScreen()));
        showConfirmMessage(message: "Welcome to Cubit!", context: context);
      }
    } else {
      if (context.mounted) {
        showErrorMessage(message: data.error, context: context);
      }
    }
  }


  Future<void> login(
      {required BuildContext context, required String email, required String password,}) async {
    showLoading(context: context);
    UniversalData data = await fireBaseService.login(
      email: email, password: password,);
    if (context.mounted) hideLoading(context: context);
    if (data.error.isEmpty) {
      if (context.mounted) {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
        showConfirmMessage(
          message: "Welcome to Cubit!", context: context,);
      }
    } else {
      if (context.mounted) {
        showErrorMessage(message: data.error, context: context,);
      }
    }
  }


Future<void> logOut({required BuildContext context}) async {
  showLoading(context: context);
  UniversalData universalData = await fireBaseService.logOut();
  if (context.mounted) hideLoading(context: context);

  if (universalData.error.isEmpty) {
    if (context.mounted) {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>AuthScreen()));
    }
  } else {
    if (context.mounted) {
      showErrorMessage(message: universalData.error, context: context);
    }
  }
}}