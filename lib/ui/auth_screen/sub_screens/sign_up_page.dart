import 'package:fifth_month/cubits/auth/auth_cubit.dart';
import 'package:fifth_month/ui/auth_screen/widgets/main_button.dart';
import 'package:fifth_month/ui/auth_screen/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key, required this.onTap});

  final VoidCallback onTap;

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController username = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign Up"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AuthTextField(hintText: "Username", controller: username),
          AuthTextField(hintText: "Email address", controller: emailController),
          AuthTextField(hintText: "Password", controller: password),
          SizedBox(
            height: 50,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                  onPressed: () {
                    widget.onTap.call();
                  },
                  child: Text("Log In"))
            ],
          ),
          SizedBox(
            height: 30,
          ),
          MainButton(
              title: "Sign Up",
              onTap: () {
                context.read<AuthCubit>().signUp(
                      context: context,
                      username: username.text,
                      email: emailController.text,
                      password: password.text,
                    );
              })
        ],
      ),
    );
  }
}
