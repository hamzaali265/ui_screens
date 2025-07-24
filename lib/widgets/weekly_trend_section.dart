import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'trend_card.dart';

class WeeklyTrendsSection extends StatefulWidget {
  const WeeklyTrendsSection({super.key});

  @override
  State<WeeklyTrendsSection> createState() => _WeeklyTrendsSectionState();
}

class _WeeklyTrendsSectionState extends State<WeeklyTrendsSection> {
  bool isWeek = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Weekly trends',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            TrendCard(
              label: 'Average',
              value: '128 mg/dL',
              color: const Color(0xFF2D8CFF),
            ),
            const SizedBox(width: 8),
            TrendCard(
              label: 'Time in range',
              value: '78%',
              color: const Color(0xFF2DBB6C),
            ),
            const SizedBox(width: 8),
            TrendCard(
              label: 'Variability',
              value: '14%',
              color: const Color(0xFFB18CFF),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            ChoiceChip(
              label: Text(
                'Week',
                style: GoogleFonts.poppins(fontWeight: FontWeight.w500),
              ),
              selected: isWeek,
              selectedColor: Colors.black,
              backgroundColor: const Color(0xFFF5F5F5),
              labelStyle: TextStyle(
                color: isWeek ? Colors.white : Colors.black,
              ),
              onSelected: (v) => setState(() => isWeek = true),
            ),
            const SizedBox(width: 8),
            ChoiceChip(
              label: Text(
                'Month',
                style: GoogleFonts.poppins(fontWeight: FontWeight.w500),
              ),
              selected: !isWeek,
              selectedColor: Colors.black,
              backgroundColor: const Color(0xFFF5F5F5),
              labelStyle: TextStyle(
                color: !isWeek ? Colors.white : Colors.black,
              ),
              onSelected: (v) => setState(() => isWeek = false),
            ),
          ],
        ),
      ],
    );
  }
}
