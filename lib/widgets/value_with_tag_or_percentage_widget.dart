import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ui_screens/enums.dart';

class ValueWithTagOrPercentageWidget extends StatelessWidget {
  final String value;
  final ValueUnit unit;
  final String tag;
  final Color backgroundColor;

  const ValueWithTagOrPercentageWidget({
    super.key,
    required this.value,
    required this.unit,
    required this.tag,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFEAEAEA)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.04),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Text(
            value,
            style: GoogleFonts.poppins(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF2DBB6C),
            ),
          ),
          const SizedBox(width: 4),
          Text(
            unit == ValueUnit.mgdl ? 'mg/dL' : '%',
            style: GoogleFonts.poppins(
              fontSize: 14,
              color: Colors.grey[700],
              fontWeight: FontWeight.w500,
            ),
          ),
          const Spacer(),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 5),
            decoration: BoxDecoration(
              color: const Color(0xFFE9F8ED),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              tag,
              style: GoogleFonts.poppins(
                color: const Color(0xFF2DBB6C),
                fontWeight: FontWeight.w600,
                fontSize: 13,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
