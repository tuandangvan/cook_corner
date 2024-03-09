import 'package:cooks_corner/pages/signin_page.dart';
import 'package:cooks_corner/theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cooks_corner/widgets/widgets.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  TextEditingController textGmail = TextEditingController();
  TextEditingController textName = TextEditingController();
  TextEditingController textPassword = TextEditingController();
  TextEditingController textRePassword = TextEditingController();
  bool obscureText = true;
  bool re_obscureText = true;
  bool _isChecked = false;
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
                    text: 'Sign up for delicious\n',
                    style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                    )),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Discoveries!',
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
                    label: 'Name',
                    icon: Icons.person_outline,
                    controller: textName,
                    errorText: '',
                    isValidated: true,
                  ),
                  const SizedBox(height: 16),
                  Input(
                    label: 'Gmail',
                    icon: Icons.alternate_email,
                    controller: textGmail,
                    isValidated: true,
                    errorText: '',
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
                    isValidated: true, errorText: '',
                  ),
                  const SizedBox(height: 16),
                  Password(
                    label: 'Re-Password',
                    obscureText: re_obscureText,
                    onPressed: () {
                      setState(() {
                        re_obscureText = !re_obscureText;
                      });
                    },
                    controller: textRePassword,
                    isValidated: true, errorText: '',
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
                          '  I agree all term and Conditions',
                          style: TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    height: 39,
                    width: 353,
                    child: TextButton(
                      onPressed: null,
                      style: TextButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(39),
                        ),
                      ),
                      child: const Text(
                        'Sign Up Now',
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
                padding: const EdgeInsets.only(top: 40, left: 83, bottom: 50),
                child: Row(children: [
                  const Text(
                    'Already have an account?',
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
                                builder: (context) => const SigninPage()));
                      },
                      child: const Text(
                        'Sign In Now',
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
