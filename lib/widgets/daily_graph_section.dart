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
  final List<String> _ranges = ['Today', 'Month', 'Year'];

  @override
  Widget build(BuildContext context) {
    double cardWidth = MediaQuery.of(context).size.width;
    final isSmallScreen = cardWidth < 400;
    final itemWidth = isSmallScreen ? cardWidth : (cardWidth - 36) / 2;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: const Color(0xFFEAEAEA)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withValues(alpha: 0.03),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  value: _selectedRange,
                  icon: const Icon(Icons.keyboard_arrow_down_rounded, size: 20),
                  style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                  ),
                  items: _ranges.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Row(
                        children: [
                          Icon(
                            Icons.calendar_today,
                            size: 18,
                            color: Colors.black,
                          ),
                          const SizedBox(width: 6),
                          Text(value),
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
                fontWeight: FontWeight.w600,
                fontSize: 18,
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
            color: Colors.white,
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
                    children: const [
                      Text(
                        '12 AM',
                        style: TextStyle(
                          fontSize: 12,
                          color: Color(0xFFBDBDBD),
                        ),
                      ),
                      Text(
                        '01 PM',
                        style: TextStyle(
                          fontSize: 12,
                          color: Color(0xFFBDBDBD),
                        ),
                      ),
                      Text(
                        '02 PM',
                        style: TextStyle(
                          fontSize: 12,
                          color: Color(0xFFBDBDBD),
                        ),
                      ),
                      Text(
                        '03 PM',
                        style: TextStyle(
                          fontSize: 12,
                          color: Color(0xFFBDBDBD),
                        ),
                      ),
                      Text(
                        '04 PM',
                        style: TextStyle(
                          fontSize: 12,
                          color: Color(0xFFBDBDBD),
                        ),
                      ),
                      Text(
                        '05 PM',
                        style: TextStyle(
                          fontSize: 12,
                          color: Color(0xFFBDBDBD),
                        ),
                      ),
                      Text(
                        '06 PM',
                        style: TextStyle(
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
          spacing: 12,
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
  }
}
