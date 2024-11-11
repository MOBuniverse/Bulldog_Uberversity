import 'package:bulldog_uberversity/services/auth/auth_service.dart';
import 'package:flutter/material.dart';
import '../components/my_button.dart';
import '../components/my_textfield.dart';

class CreateAccountScreen extends StatefulWidget {
  final void Function()? onTap;

  const CreateAccountScreen({super.key, required this.onTap,});

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
  }

class _CreateAccountScreenState extends State<CreateAccountScreen>{
  //text editing controllers
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  // Create account method
  void createAccount() async{
    //  get auth service
    final authService = AuthService();

    // Check if passwords match -> create user account
    if(passwordController.text == confirmPasswordController.text){

      // Try creating user
      try {
        await authService.signUpWithEmailPass(
          emailController.text, 
          passwordController.text,
          );
      }

      // Display any errors
      catch(e) {
        showDialog(
          // ignore: use_build_context_synchronously
          context: context,
          builder: (context) => AlertDialog(
            title: Text(e.toString()),
          ),
        );
      }
    }

    // If passwords don't match -> show error
    else {
      showDialog(
          // ignore: use_build_context_synchronously
          context: context,
          builder: (context) => AlertDialog(
            title: Text("Passwords don't match!"),
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
          Icon(
            Icons.lock_open_rounded,
            size: 100,
            color: Theme.of(context).colorScheme.inversePrimary,
          ),
          const SizedBox(height: 25),

          //message, slogan
          Text("Let's Get You Setup", 
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

            //confirm password textbox
            MyTextfield(
              controller: confirmPasswordController,
              hintText: "Confirm password",
              obscureText: true,
            ),


            const SizedBox(height: 10),

            //sign up button
            MyButton(
              text: "Create Account", 
              onTap: createAccount,
            ),

            const SizedBox(height: 25),

            //already have an account? Login Here 
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already have an account?",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary),
                  ),
                const SizedBox(width: 4),
                GestureDetector(
                  onTap: widget.onTap,
                  child: Text(
                    "Login", 
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