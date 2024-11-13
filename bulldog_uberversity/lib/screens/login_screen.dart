import 'package:bulldog_uberversity/components/my_button.dart';
import 'package:bulldog_uberversity/components/my_textfield.dart';
import 'package:bulldog_uberversity/services/auth/auth_service.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget 
{
  final void Function()? onTap;


   const LoginScreen({super.key, required this.onTap});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  //text editing controllers
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();


  //login method
  void login() async{
    // Get instance of auth service
    final  authService = AuthService();

    // Try to sign in
    try {
      await authService.signInWithEmailPass(
        emailController.text, 
        passwordController.text,
        );
    }

    // display any errors
    catch (e){
      showDialog(
          // ignore: use_build_context_synchronously
          context: context,
          builder: (context) => AlertDialog(
            title: Text(e.toString()),
        ),
      );
    }
  }



  @override
  Widget build(BuildContext context) 
  {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //logo
          Image.asset('Logo/Bulldog_logo/Bulldog_Logo.png',
          width: 250, // adjust width as needed
          height: 250, // adjust height as needed
          fit: BoxFit.cover,
          ),
          
          const SizedBox(height: 25),

          //message, slogan
          Text("Bulldogs Uberversity", 
          style: TextStyle(
            fontSize: 16, 
            color: Theme.of(context).colorScheme.inversePrimary,
            )
            ),

            const SizedBox(height: 25),

            //email textbox
            MyTextfield(
              controller: emailController,
              hintText: "Email",
              obscureText: false,
            ),

            const SizedBox(height: 10),

            //password textbox
            MyTextfield(
              controller: passwordController,
              hintText: "Password",
              obscureText: true,
            ),

            const SizedBox(height: 10),

            //sign in button
            MyButton(
              text: "Sign In", 
              onTap: login,
            ),

            const SizedBox(height: 25),

            //register 
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "No Account?",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary),
                  ),
                const SizedBox(width: 4),
                GestureDetector(
                  onTap: widget.onTap,
                  child: Text(
                    "Create account!", 
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),

          ],
        ),
      ),
    );
  }
}