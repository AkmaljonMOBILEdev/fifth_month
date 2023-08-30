import 'package:fifth_month/cubits/auth/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LogOutScreen extends StatelessWidget {
  const LogOutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Log Out"),
        actions: [
          IconButton(onPressed: (){
            context.read<AuthCubit>().logOut(context: context);
          }, icon: Icon(Icons.logout))
        ],
      ),
      body: Center(
        child: Text("Logging out"),
      ),
    );
  }
}
