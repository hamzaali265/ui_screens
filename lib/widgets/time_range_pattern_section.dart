import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ui_screens/enums.dart';
import 'value_with_tag_or_percentage_widget.dart';

class TimeInRangePatternsSection extends StatelessWidget {
  const TimeInRangePatternsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final double cardWidth = MediaQuery.of(context).size.width * 0.45;

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
            SizedBox(
              width: cardWidth,
              child: ValueWithTagOrPercentageWidget(
                leadingIcon: Icons.wb_sunny,
                heading: 'Morning',
                value: '85',
                unit: ValueUnit.percentage,
                valueColor: const Color(0xFFFFC542),
                headingColor: Colors.black,
                showColumnLayout: false,
                horizontal: 12,
                vertical: 12,
              ),
            ),
            SizedBox(
              width: cardWidth,
              child: ValueWithTagOrPercentageWidget(
                leadingIcon: Icons.wb_twilight,
                heading: 'Afternoon',
                value: '64',
                unit: ValueUnit.percentage,
                valueColor: const Color(0xFF6C63FF),
                headingColor: Colors.black,
                showColumnLayout: false,
                horizontal: 12,
                vertical: 12,
              ),
            ),
            SizedBox(
              width: cardWidth,
              child: ValueWithTagOrPercentageWidget(
                leadingIcon: Icons.nights_stay,
                heading: 'Evening',
                value: '50',
                unit: ValueUnit.percentage,
                valueColor: const Color(0xFF2D8CFF),
                headingColor: Colors.black,
                showColumnLayout: false,
                horizontal: 12,
                vertical: 12,
              ),
            ),
            SizedBox(
              width: cardWidth,
              child: ValueWithTagOrPercentageWidget(
                leadingIcon: Icons.nightlight_round,
                heading: 'Night',
                value: '93',
                unit: ValueUnit.percentage,
                valueColor: const Color(0xFF2DBB6C),
                headingColor: Colors.black,
                showColumnLayout: false,
                horizontal: 12,
                vertical: 12,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
