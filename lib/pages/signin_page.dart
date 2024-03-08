import 'package:cooks_corner/pages/signup_page.dart';
import 'package:cooks_corner/screens/home_screen.dart';
import 'package:cooks_corner/theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cooks_corner/widgets/widgets.dart';

class SigninPage extends StatefulWidget {
  const SigninPage({Key? key}) : super(key: key);

  @override
  State<SigninPage> createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  TextEditingController textGmail = TextEditingController();
  TextEditingController textPassword = TextEditingController();

  bool obscureText = true;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Stack(children: <Widget>[
              Image.asset(
                'assets/images/background_1.png',
                fit: BoxFit.cover,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 89, left: 21),
                child: RichText(
                  text: TextSpan(
                    text: 'Welcome Back\nTo ',
                    style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                    )),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Cookscorner',
                        style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ]),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 36.48),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Input(
                    label: 'Gmail',
                    icon: Icons.alternate_email,
                    controller: textGmail,
                  ),
                  const SizedBox(height: 16),
                  Password(
                      label: 'Password',
                      obscureText: obscureText,
                      onPressed: () {
                        setState(() {
                          obscureText = !obscureText;
                        });
                      },
                      controller: textPassword),
                  const SizedBox(height: 16),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Forgot password?',
                        style: TextStyle(
                          color: AppColors.textColor,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    height: 39,
                    width: 353,
                    child: TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomeScreen()));
                      },
                      style: TextButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(39),
                        ),
                      ),
                      child: const Text(
                        'Sign In Now',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(top: 150, left: 83, bottom: 65),
                child: Row(children: [
                  const Text(
                    'I don’t have an account?',
                    style: TextStyle(
                      color: AppColors.textColor,
                      fontSize: 12,
                    ),
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SignupPage()));
                      },
                      child: const Text(
                        'Sign Up Now',
                        style: TextStyle(
                          color: AppColors.primary,
                          fontSize: 12,
                        ),
                      )),
                ]),
              ),
            )
          ],
        ),
      ),
    );
  }
}
