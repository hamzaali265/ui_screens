import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LogDayChip extends StatelessWidget {
  final String day;
  final String date;
  final bool selected;
  const LogDayChip({
    super.key,
    required this.day,
    required this.date,
    this.selected = false,
  });
  @override
  Widget build(BuildContext context) {
    final Color bgColor = selected ? Colors.black : const Color(0xFFF5F5F5);
    final Color textColor = selected
        ? Colors.white
        : Colors.black.withValues(alpha: 0.5);
    final Color dateColor = selected
        ? Colors.white
        : Colors.black.withValues(alpha: 0.7);

    return Container(
      margin: const EdgeInsets.only(right: 10),
      width: 48,
      height: 72,
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: Colors.transparent),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            day,
            style: GoogleFonts.poppins(
              color: textColor,
              fontWeight: FontWeight.w500,
              fontSize: 15,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            date,
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.bold,
              color: dateColor,
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }
}
