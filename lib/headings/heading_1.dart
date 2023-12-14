import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HeadingOne extends StatelessWidget {
  const HeadingOne(this.title, {super.key});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: TextAlign.center,
      style: GoogleFonts.lato(
        color: const Color.fromARGB(255, 233, 227, 250),
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
