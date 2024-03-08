import 'package:cooks_corner/theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Input extends StatelessWidget {
  const Input({
    Key? key,
    required this.label,
    required this.icon,
    required this.controller,
  }) : super(key: key);

  final String label;
  final IconData icon;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.background,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 0),
            child: Text(label,
                style: GoogleFonts.poppins(
                  textStyle:
                      const TextStyle(fontSize: 16, color: AppColors.primary),
                )),
          ),
          SizedBox(
            height: 42,
            child: TextFormField(
              maxLines: 1,
              minLines: 1,
              expands: false,
              controller: controller,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.only(left: 19, top: 9),
                suffixStyle:
                    const TextStyle(fontSize: 14, color: AppColors.textFaded),
                suffixIcon: Icon(icon),
                suffixIconColor: AppColors.textFaded,
                fillColor: AppColors.inputBackground,
                hintText: 'Enter your $label',
                hintStyle:
                    const TextStyle(fontSize: 14, color: AppColors.textFaded),
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(42),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Password extends StatefulWidget {
  const Password({
    Key? key,
    required this.label,
    required this.obscureText,
    required this.onPressed,
    required this.controller,
  }) : super(key: key);

  final String label;
  final bool obscureText;
  final VoidCallback? onPressed;
  final TextEditingController controller;

  @override
  State<Password> createState() => _PasswordState();
}

class _PasswordState extends State<Password> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.background,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 0),
            child: Text(widget.label,
                style: GoogleFonts.poppins(
                  textStyle:
                      const TextStyle(fontSize: 16, color: AppColors.primary),
                )),
          ),
          SizedBox(
            height: 42,
            child: TextField(
              controller: widget.controller,
              obscureText: widget.obscureText,
              obscuringCharacter: '*',
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.only(left: 19, top: 9),
                suffixStyle:
                    const TextStyle(fontSize: 14, color: AppColors.textFaded),
                suffixIcon: GestureDetector(
                    onTap: () => widget.onPressed!(),
                    child: widget.obscureText
                        ? const Icon(Icons.visibility_off_outlined)
                        : const Icon(Icons.visibility_outlined)),
                suffixIconColor: AppColors.textFaded,
                fillColor: AppColors.inputBackground,
                hintText: widget.label == 'Password'
                    ? 'Enter your ${widget.label}'
                    : 'Re-Enter your password',
                hintStyle:
                    const TextStyle(fontSize: 14, color: AppColors.textFaded),
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(42),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
