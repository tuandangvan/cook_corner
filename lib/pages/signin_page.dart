import 'package:cooks_corner/pages/signup_page.dart';
import 'package:cooks_corner/screens/home_screen.dart';
import 'package:cooks_corner/theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cooks_corner/widgets/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SigninPage extends StatefulWidget {
  const SigninPage({Key? key}) : super(key: key);

  @override
  State<SigninPage> createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  TextEditingController textGmail = TextEditingController();
  TextEditingController textPassword = TextEditingController();
  bool validateGmail = true;
  String? errorGmail = "";
  bool validatePassword = true;

  bool obscureText = true;

  String? errorPassword = '';

  bool _isChecked = false;
  @override
  void initState() {
    super.initState();
  }

  Future<void> rememberLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isLoggedIn', true);
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
                    isValidated: validateGmail,
                    errorText: errorGmail!,
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
                    controller: textPassword,
                    isValidated: validatePassword,
                    errorText: errorPassword!,
                  ),
                  const SizedBox(height: 16),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Row(
                      children: [
                        Container(
                          height: 13.5,
                          width: 13.5,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: AppColors.textColor,
                            ),
                          ),
                          child: Checkbox(
                            activeColor: Colors.transparent,
                            checkColor: AppColors.textColor,
                            value: _isChecked,
                            onChanged: (bool? value) {
                              setState(() {
                                _isChecked = value!;
                              });
                            },
                          ),
                        ),
                        const Text(
                          '  Remember Sign in',
                          style: TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                  ),
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
                      onPressed: () async {
                        setState(() {
                          validateGmail = textGmail.text.isNotEmpty;
                          validatePassword = textPassword.text.isNotEmpty;
                          errorGmail = validateGmail ? "" : "Please enter email";
                          errorPassword =
                              validatePassword ? "" : "Please enter password";
                        });

                        if (validateGmail && validatePassword || validateGmail) {
                          Pattern pattern =
                              r'^[a-z0-9]{3,}@g(oogle)?mail\.com$';
                          RegExp regex = RegExp(pattern.toString());

                          if (!regex.hasMatch(textGmail.text)) {
                            setState(() {
                              validateGmail = false;
                              errorGmail = "Please enter a valid Gmail address";
                            });
                          } else {
                            if (_isChecked) {
                              await rememberLogin();
                            }

                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomeScreen()));
                          }
                        }
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
