import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:pratmandu/screens/splash_screen.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(textTheme: GoogleFonts.poppinsTextTheme()),
      home: SplashScreen(),
    );
  }
}
