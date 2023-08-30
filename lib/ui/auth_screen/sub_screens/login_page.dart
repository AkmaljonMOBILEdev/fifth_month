import 'package:fifth_month/cubits/auth/auth_cubit.dart';
import 'package:fifth_month/ui/auth_screen/widgets/main_button.dart';
import 'package:fifth_month/ui/auth_screen/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key, required this.onTap});

  final VoidCallback onTap;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
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
                  child: Text("Sign Up"))
            ],
          ),
          SizedBox(
            height: 30,
          ),
          MainButton(
              title: "Login",
              onTap: () {
                context.read<AuthCubit>().login(
                      context: context,
                      email: emailController.text,
                      password: password.text,
                    );
              })
        ],
      ),
    );
  }
}
