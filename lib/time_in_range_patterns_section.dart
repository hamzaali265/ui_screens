import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TimeInRangePatternsSection extends StatelessWidget {
  const TimeInRangePatternsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Time in range patterns',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 10),
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: [
            PatternChip(
              icon: Icons.wb_sunny,
              label: 'Morning',
              value: '85%',
              color: const Color(0xFFFFC542),
            ),
            PatternChip(
              icon: Icons.wb_twilight,
              label: 'Afternoon',
              value: '64%',
              color: const Color(0xFF6C63FF),
            ),
            PatternChip(
              icon: Icons.nights_stay,
              label: 'Evening',
              value: '50%',
              color: const Color(0xFF2D8CFF),
            ),
            PatternChip(
              icon: Icons.nightlight_round,
              label: 'Night',
              value: '93%',
              color: const Color(0xFF2DBB6C),
            ),
          ],
        ),
      ],
    );
  }
}

class PatternChip extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final Color color;
  const PatternChip({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
    required this.color,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFEAEAEA)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.04),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 18, color: color),
          const SizedBox(width: 6),
          Text(
            label,
            style: GoogleFonts.poppins(
              fontSize: 13,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          ),
          const SizedBox(width: 6),
          Text(
            value,
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.bold,
              color: color,
              fontSize: 13,
            ),
          ),
        ],
      ),
    );
  }
}
