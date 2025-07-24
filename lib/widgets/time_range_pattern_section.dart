import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'pattern_chip.dart';

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
