import 'package:flutter/material.dart';

ThemeData darkMode = ThemeData(
  colorScheme: ColorScheme.dark(
  surface: const Color(0xFF1E1E1E),          // Dark Gray - surface
  primary: const Color(0xFF292D3E),          // Dark purple-gray primary
  secondary: const Color(0xFFE91E63),        // Pink secondary
  tertiary: const Color(0xFF80CBC4),         // Teal tertiary
  primaryContainer: const Color(0xFF3C3F58), // Darker purple-gray for containers
  secondaryContainer: const Color(0xFF8E24AA), // Purple for accents and containers
  onSurface: const Color(0xFFB0BEC5),        // Soft teal-gray for text/icons on surfaces
  onPrimary: const Color(0xFFE1BEE7),        // Light lavender for text/icons on primary
  onSecondary: const Color(0xFFF8BBD0),      // Light pink for text/icons on secondary
  onTertiary: const Color(0xFFA7FFEB),       // Light teal for text/icons on tertiary
  inversePrimary: Colors.grey.shade200       // Light gray for contrast
)
);

//colorScheme: ColorScheme.dark(
   // surface: const Color.fromARGB(255, 22, 22, 23),
    //primary: const Color.fromARGB(255, 40, 40, 42),
    //secondary: const Color.fromARGB(255, 198, 139, 57),
   // tertiary: const Color.fromARGB(255, 6, 70, 99),
    //inversePrimary: Colors.grey.shade300
    //)