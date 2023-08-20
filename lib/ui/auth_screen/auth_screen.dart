import 'package:fifth_month/ui/auth_screen/sub_screens/login_page.dart';
import 'package:fifth_month/ui/auth_screen/sub_screens/sign_up_page.dart';
import 'package:flutter/material.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool isLogin = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: isLogin
            ? LoginPage(onTap: () {
                setState(() {
                  isLogin = false;
                });
              })
            : SignUpPage(onTap: () {
                setState(() {
                  isLogin = true;
                });
              }));
  }
}
