import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Button extends StatelessWidget {
  final String text;
  final TextStyle textStyle;
  final Color backgroundColor;
  final double width;
  final double height;
  final double borderRadius;
  final VoidCallback? onPressed;

  Button(
      {required this.text,
      this.onPressed,
      required this.backgroundColor,
      required this.width,
      required this.height,
      required this.borderRadius,
      required this.textStyle});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius),
          color: backgroundColor,
        ),
        child: Center(
            child: Text(
          text,
          style: GoogleFonts.poppins(
            textStyle: textStyle,
          ),
        )),
      ),
    );
  }
}
