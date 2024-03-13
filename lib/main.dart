import 'package:cooks_corner/pages/signin_page.dart';
import 'package:flutter/material.dart';
import 'package:cooks_corner/screens/screens.dart';
import 'package:cooks_corner/theme.dart';
import 'package:flutter_splash_screen/flutter_splash_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool isLogged = prefs.getBool('isLoggedIn') ?? false;
  runApp(MyApp(isLogged: isLogged));
}

class MyApp extends StatefulWidget {
  final bool isLogged;
  const MyApp({super.key, required this.isLogged});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    hideScreen();
  }

  Future<void> hideScreen() async {
    Future.delayed(const Duration(seconds: 5), () {
      FlutterSplashScreen.hide();
    });
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light(),
      darkTheme: AppTheme.dark(),
      themeMode: ThemeMode.dark,
      title: 'CooksCorner',
      home: widget.isLogged ? HomeScreen() : const SigninPage(),
    );
  }
}
