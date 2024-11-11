import 'package:bulldog_uberversity/services/auth/auth_gate.dart';
import 'package:bulldog_uberversity/color_modes/mode_provider.dart';
import 'package:bulldog_uberversity/firebase_options.dart';
import 'package:bulldog_uberversity/models/restaurant.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(
    // Theme and resturant provider
    MultiProvider(
      providers: [
        // theme provider
        ChangeNotifierProvider(create: (context) => ModeProvider()),

        // restaurant provider
        ChangeNotifierProvider(create: (context) => Restaurant()),

      ],
      child: const MyApp(),
    ),
  );
}
}

class MyApp extends StatelessWidget 
{
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) 
  {
    return MaterialApp(debugShowCheckedModeBanner: false,
    home: const AuthGate(),
    theme: Provider.of<ModeProvider>(context).themeData,
    );
  }   
}

