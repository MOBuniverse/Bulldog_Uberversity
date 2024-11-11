// Purpose of this is to check if 
//current user is logged in or not

import 'package:bulldog_uberversity/screens/home_screen.dart';
import 'package:bulldog_uberversity/services/auth/login_or_create_account.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
        // User is logged in 
        if (snapshot.hasData){
          return const HomeScreen();
        }

        //User is NOT logged in
        else {
          return const LoginOrCreateAccount();
        }
        },
      ),
    );
  }
}