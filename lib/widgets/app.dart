import 'package:cuisine_app/screens/tab_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final theme = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
        seedColor: const Color.fromARGB(255, 131, 57, 0),
        brightness: Brightness.dark),
    textTheme: GoogleFonts.lailaTextTheme());

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(theme: theme, home: const TabScreen());
  }
}
