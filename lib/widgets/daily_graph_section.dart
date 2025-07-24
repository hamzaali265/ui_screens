import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../enums.dart';
import 'value_with_tag_or_percentage_widget.dart';

class DailyGraphSection extends StatefulWidget {
  const DailyGraphSection({super.key});

  @override
  State<DailyGraphSection> createState() => _DailyGraphSectionState();
}

class _DailyGraphSectionState extends State<DailyGraphSection> {
  String _selectedRange = 'Today';
  final List<String> _ranges = ['Today', 'Yesterday', 'This Week'];

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final double totalWidth = constraints.maxWidth;
        final double spacing = 12;
        final double itemWidth = (totalWidth - spacing) / 2;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(100),
                    border: Border.all(color: const Color(0xFFEAEAEA)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withValues(alpha: 0.1),
                        blurRadius: 4,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      value: _selectedRange,
                      icon: const Icon(
                        Icons.keyboard_arrow_down_rounded,
                        size: 16,
                        color: Colors.grey,
                      ),
                      style: GoogleFonts.poppins(
                        color: Colors.black,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                      items: _ranges.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Row(
                            children: [
                              const SizedBox(width: 6),
                              const Icon(
                                Icons.calendar_today,
                                size: 18,
                                color: Colors.black,
                              ),
                              const SizedBox(width: 6),
                              Text(
                                value,
                                style: GoogleFonts.poppins(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          _selectedRange = newValue!;
                        });
                      },
                    ),
                  ),
                ),
                Text(
                  'Daily graph',
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 14),

            Container(
              width: double.infinity,
              height: 140,
              decoration: BoxDecoration(
                color: Color(0xffF2F2F2),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: const Color(0xFFEAEAEA)),
              ),
              child: Stack(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: List.generate(7, (index) {
                      return Container(
                        width: 1,
                        margin: const EdgeInsets.symmetric(vertical: 18),
                        color: const Color(0xFFF5F5F5),
                      );
                    }),
                  ),
                  Center(
                    child: Text(
                      'No data',
                      style: GoogleFonts.poppins(
                        color: Colors.grey[400],
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 8,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          for (final label in [
                            '12 AM',
                            '01 PM',
                            '02 PM',
                            '03 PM',
                            '04 PM',
                            '05 PM',
                            '06 PM',
                          ])
                            Text(
                              label,
                              style: const TextStyle(
                                fontSize: 12,
                                color: Color(0xFFBDBDBD),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            Wrap(
              spacing: spacing,
              runSpacing: 8,
              children: [
                SizedBox(
                  width: itemWidth,
                  child: ValueWithTagOrPercentageWidget(
                    heading: "Average",
                    value: "46",
                    unit: ValueUnit.mgdl,
                    valueColor: Colors.blue,
                  ),
                ),
                SizedBox(
                  width: itemWidth,
                  child: ValueWithTagOrPercentageWidget(
                    heading: "Time in range",
                    value: "46",
                    unit: ValueUnit.percentage,
                    valueColor: Colors.blue,
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
