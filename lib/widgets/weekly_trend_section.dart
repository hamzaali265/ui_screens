import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ui_screens/enums.dart';
import 'package:ui_screens/widgets/custom_toggle_widget.dart';

import 'value_with_tag_or_percentage_widget.dart';

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
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Weekly trends',
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w600,
                fontSize: 17,
                color: Colors.black,
              ),
            ),
            CustomToggleWidget(),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              child: ValueWithTagOrPercentageWidget(
                heading: 'Average',
                headingFontSize: 10,
                value: '128',
                unit: ValueUnit.mgdl,
                unitFontSize: 10,
                valueColor: const Color(0xFF2D8CFF),
                showColumnLayout: true,
                horizontal: 8,
                vertical: 8,
                backgroundColor: Colors.blue[50]!,
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: ValueWithTagOrPercentageWidget(
                heading: 'Time in range',
                headingFontSize: 10,
                value: '78',
                unit: ValueUnit.percentage,
                unitFontSize: 10,
                valueColor: const Color(0xFF2DBB6C),
                showColumnLayout: true,
                horizontal: 8,
                vertical: 8,
                backgroundColor: Colors.green[50]!,
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: ValueWithTagOrPercentageWidget(
                heading: 'Variability',
                headingFontSize: 10,
                value: '14',
                unit: ValueUnit.percentage,
                unitFontSize: 10,
                valueColor: const Color(0xFFB18CFF),
                showColumnLayout: true,
                horizontal: 8,
                vertical: 8,
                backgroundColor: Colors.blue[50]!,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
