import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
  colorScheme: ColorScheme.light(
  surface: const Color(0xFFF5F5F5),          // Light Gray - surface
  primary: const Color(0xFF8E24AA),          // Medium purple primary
  secondary: const Color.fromARGB(255, 255, 123, 167),        // Pink secondary
  tertiary: const Color.fromARGB(255, 22, 177, 182),         // Teal tertiary
  primaryContainer:Colors.grey.shade300, // Light lavender for containers
  secondaryContainer: const Color.fromARGB(255, 255, 229, 238), // Light pink for accents and containers
  onSurface: const Color(0xFF424242),        // Dark gray for text/icons on surfaces
  onPrimary: const Color(0xFF4A0072),        // Darker purple for text/icons on primary
  onSecondary: const Color(0xFF880E4F),      // Darker pink for text/icons on secondary
  onTertiary: const Color(0xFF004D40),       // Dark teal for text/icons on tertiary
  inversePrimary: Colors.grey.shade800       // Dark gray for contrast
)

  );



 // colorScheme: ColorScheme.light(
   // surface: Colors.grey.shade300,
    //primary: Colors.grey.shade500,
    //secondary: Colors.grey.shade100,
    //tertiary: Colors.white,
   // inversePrimary: Colors.grey.shade700
   // )