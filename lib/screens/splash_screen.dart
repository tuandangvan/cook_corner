import 'package:cooks_corner/pages/signin_page.dart';
import 'package:cooks_corner/theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const SigninPage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'assets/images/skillet_cooktop.png',
              width: 90.99,
              height: 90.99,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 12),
            const Text(
              "CooksCorner",
              style: TextStyle(color: AppColors.secondary, fontSize: 18),
            ),
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
          top: false,
          bottom: true,
          child: Padding(
            padding: const EdgeInsets.only(left: 155, bottom: 40),
            child: Text(
              "Version 0.0.1",
              style: GoogleFonts.poppins(
                      textStyle: const TextStyle(fontSize: 14, color: AppColors.secondary)),
            ),
          )),
    );
  }
}
