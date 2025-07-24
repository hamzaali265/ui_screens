import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ui_screens/enums.dart';
import 'value_with_tag_or_percentage_widget.dart';

class TimeInRangePatternsSection extends StatelessWidget {
  const TimeInRangePatternsSection({super.key});

  @override
  Widget build(BuildContext context) {
    const spacing = 10.0;

    return LayoutBuilder(
      builder: (context, constraints) {
        final double cardWidth = (constraints.maxWidth - spacing) / 2;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Time in range patterns',
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w600,
                fontSize: 17,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 10),
            Wrap(
              spacing: spacing,
              runSpacing: spacing,
              children: [
                _buildCard(
                  'Morning',
                  Icons.wb_sunny,
                  '85',
                  ValueUnit.percentage,
                  const Color(0xFFFFD700),
                  cardWidth,
                ),
                _buildCard(
                  'Afternoon',
                  Icons.wb_twilight,
                  '64',
                  ValueUnit.percentage,
                  const Color(0xFFFFA500),
                  cardWidth,
                ),
                _buildCard(
                  'Evening',
                  Icons.nights_stay,
                  '50',
                  ValueUnit.percentage,
                  const Color(0xFF1E90FF),
                  cardWidth,
                ),
                _buildCard(
                  'Night',
                  Icons.nightlight_round,
                  '93',
                  ValueUnit.percentage,
                  const Color(0xFF483D8B),
                  cardWidth,
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  Widget _buildCard(
    String heading,
    IconData icon,
    String value,
    ValueUnit unit,
    Color iconColor,
    double width,
  ) {
    return SizedBox(
      width: width,
      child: ValueWithTagOrPercentageWidget(
        leadingIcon: icon,
        heading: heading,
        value: value,
        unit: unit,
        valueColor: const Color(0xFF6C63FF),
        showColumnLayout: false,
        horizontal: 12,
        vertical: 12,
        iconColor: iconColor,
      ),
    );
  }
}
