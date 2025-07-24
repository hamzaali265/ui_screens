import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ui_screens/enums.dart';

class ValueWithTagOrPercentageWidget extends StatelessWidget {
  final IconData? leadingIcon;
  final String? heading;
  final String value;
  final ValueUnit? unit;
  final String? tag;
  final Color backgroundColor;
  final Color valueColor;
  final Color? headingColor;
  final Color? unitColor;
  final Color? tagTextColor;
  final Color? tagBackgroundColor;
  final double horizontal;
  final double vertical;

  const ValueWithTagOrPercentageWidget({
    super.key,
    this.leadingIcon,
    this.heading,
    required this.value,
    this.unit,
    this.tag,
    this.backgroundColor = Colors.white,
    this.valueColor = const Color(0xFF2DBB6C),
    this.headingColor = const Color(0xFF555555),
    this.unitColor,
    this.tagTextColor = const Color(0xFF2DBB6C),
    this.tagBackgroundColor = const Color(0xFFE9F8ED),
    this.horizontal = 16,
    this.vertical = 14,
  });

  @override
  Widget build(BuildContext context) {
    final showColumnLayout = tag == null && leadingIcon == null;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: horizontal, vertical: vertical),
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
      child: showColumnLayout
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  heading!,
                  style: GoogleFonts.poppins(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: headingColor,
                  ),
                ),
                const SizedBox(height: 6),
                Row(
                  children: [
                    Text(
                      value,
                      style: GoogleFonts.poppins(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: valueColor,
                      ),
                    ),
                    if (unit != null) ...[
                      const SizedBox(width: 2),
                      Text(
                        unit == ValueUnit.mgdl ? 'mg/dL' : '%',
                        style: GoogleFonts.poppins(
                          fontSize: 13,
                          color: unitColor ?? headingColor,
                        ),
                      ),
                    ],
                    const Spacer(),
                    if (tag != null)
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: tagBackgroundColor,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          tag!,
                          style: GoogleFonts.poppins(
                            color: tagTextColor,
                            fontWeight: FontWeight.w600,
                            fontSize: 12,
                          ),
                        ),
                      ),
                  ],
                ),
              ],
            )
          : Row(
              children: [
                if (leadingIcon != null) ...[
                  Icon(leadingIcon, size: 18, color: valueColor),
                  const SizedBox(width: 6),
                ],
                if (heading != null) ...[
                  Text(
                    heading!,
                    style: GoogleFonts.poppins(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      color: headingColor,
                    ),
                  ),
                  const SizedBox(width: 6),
                ],
                Text(
                  value,
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: valueColor,
                  ),
                ),
                if (unit != null) ...[
                  const SizedBox(width: 2),
                  Text(
                    unit == ValueUnit.mgdl ? 'mg/dL' : '%',
                    style: GoogleFonts.poppins(
                      fontSize: 13,
                      color: unitColor ?? headingColor,
                    ),
                  ),
                ],
                const Spacer(),
                if (tag != null)
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: tagBackgroundColor,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      tag!,
                      style: GoogleFonts.poppins(
                        color: tagTextColor,
                        fontWeight: FontWeight.w600,
                        fontSize: 12,
                      ),
                    ),
                  ),
              ],
            ),
    );
  }
}
