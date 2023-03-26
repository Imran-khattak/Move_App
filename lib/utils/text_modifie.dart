import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextModifie extends StatelessWidget {
  final String text;
  final Color color;
  final double size;
  const TextModifie(
      {super.key, required this.text, required this.color, required this.size});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.breeSerif(
        color: color,
        fontSize: size,
      ),
    );
  }
}
