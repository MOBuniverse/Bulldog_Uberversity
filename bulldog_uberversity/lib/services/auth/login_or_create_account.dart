import 'package:bulldog_uberversity/screens/create_account_screen.dart';
import 'package:bulldog_uberversity/screens/login_screen.dart';
import 'package:flutter/material.dart';

class LoginOrCreateAccount extends StatefulWidget{
  const LoginOrCreateAccount({super.key});

@override
  State<LoginOrCreateAccount> createState() => _LoginOrCreateAccountState();
}


class _LoginOrCreateAccountState extends State<LoginOrCreateAccount>{

  //initally, show login page
  bool showLoginScreen = true;

  //toggle between login and create account page
  void toggleScreens(){
    setState(() {
      showLoginScreen = !showLoginScreen;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginScreen){
      return LoginScreen(onTap: toggleScreens);
    } 
    else 
    {
      return CreateAccountScreen(onTap: toggleScreens);
    }
  }
}