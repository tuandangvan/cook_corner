import 'package:cooks_corner/theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class Input extends StatefulWidget {
  Input({
    Key? key,
    required this.label,
    required this.icon,
    required this.controller,
    required this.isValidated,
    required this.errorText,
    this.onChanged,
  }) : super(key: key);

  final String label;
  final IconData icon;
  final TextEditingController controller;
  bool isValidated;
  String errorText;
  final VoidCallbackAction? onChanged;

  @override
  State<Input> createState() => _InputState();
}

class _InputState extends State<Input> {
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
            height: 65,
            child: TextFormField(
              onChanged: (value) {
                setState(() {
                  widget.isValidated = true;
                  widget.errorText = '';
                });
              },
              maxLines: 1,
              minLines: 1,
              expands: false,
              controller: widget.controller,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.only(left: 19, top: 9),
                suffixStyle:
                    const TextStyle(fontSize: 14, color: AppColors.textFaded),
                suffixIcon: Icon(widget.icon),
                suffixIconColor: AppColors.textFaded,
                fillColor: AppColors.inputBackground,
                hintText: 'Enter your ${widget.label}',
                hintStyle:
                    const TextStyle(fontSize: 14, color: AppColors.textFaded),
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(42),
                ),
                errorText: widget.isValidated ? null : widget.errorText,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class Password extends StatefulWidget {
  Password({
    Key? key,
    required this.label,
    required this.obscureText,
    required this.onPressed,
    required this.controller,
    required this.isValidated,
    required this.errorText,
  }) : super(key: key);

  final String label;
  final bool obscureText;
  final VoidCallback? onPressed;
  final TextEditingController controller;
  bool isValidated;
  String errorText;

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
            height: 65,
            child: TextFormField(
              onChanged: (value) {
                setState(() {
                  widget.isValidated = true;
                  widget.errorText = '';
                });
              },
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
                errorText: widget.isValidated ? null : widget.errorText,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
