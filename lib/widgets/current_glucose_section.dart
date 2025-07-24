import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ui_screens/enums.dart';
import 'package:ui_screens/widgets/value_with_tag_or_percentage_widget.dart';

class CurrentGlucoseSection extends StatelessWidget {
  const CurrentGlucoseSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Current glucose',
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w600,
                fontSize: 17,
                color: Colors.black,
              ),
            ),
            Text(
              'Updated just now',
              style: GoogleFonts.poppins(
                color: Colors.grey[500],
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        ValueWithTagOrPercentageWidget(
          value: '128',
          unit: ValueUnit.mgdl,
          tag: "In range",
          backgroundColor: Colors.grey.withValues(alpha: 0.05),
        ),
      ],
    );
  }
}
