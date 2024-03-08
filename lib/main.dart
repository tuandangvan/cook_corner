import 'package:flutter/material.dart';
import 'package:cooks_corner/screens/screens.dart';
import 'package:cooks_corner/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light(),
      darkTheme: AppTheme.dark(),
      themeMode: ThemeMode.dark,
      title: 'CooksCorner',
      home: const SplashScreen(),
    );
  }
}
