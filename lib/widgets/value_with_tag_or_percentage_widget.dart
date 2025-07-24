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
  final bool showColumnLayout;
  final double? headingFontSize;
  final double? valueFontSize;
  final double? unitFontSize;
  final double? tagFontSize;

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
    this.showColumnLayout = false,
    this.headingFontSize,
    this.valueFontSize,
    this.unitFontSize,
    this.tagFontSize,
  });

  @override
  Widget build(BuildContext context) {
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
      child: showColumnLayout ? _buildColumnLayout() : _buildRowLayout(),
    );
  }

  Widget _buildColumnLayout() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (heading != null) _buildHeading(),
        if (heading != null) const SizedBox(height: 6),
        Row(
          children: [
            _buildValueText(),
            Flexible(child: _buildUnitText()),
            const Spacer(),
            _buildTag(),
          ],
        ),
      ],
    );
  }

  Widget _buildRowLayout() {
    return Row(
      children: [
        if (leadingIcon != null) ...[
          Icon(leadingIcon, size: 18, color: valueColor),
          const SizedBox(width: 6),
        ],
        if (heading != null && leadingIcon == null) ...[
          _buildHeading(),
          const Spacer(),
          _buildValueText(),
          _buildUnitText(),
        ] else ...[
          if (heading != null) ...[_buildHeading(), const SizedBox(width: 6)],
          _buildValueText(),
          _buildUnitText(),
        ],
        tag != null ? Spacer() : SizedBox.shrink(),
        _buildTag(),
      ],
    );
  }

  Widget _buildValueText() {
    return Text(
      value,
      style: GoogleFonts.poppins(
        fontSize: valueFontSize ?? 18,
        fontWeight: FontWeight.w600,
        color: valueColor,
      ),
    );
  }

  Widget _buildUnitText() {
    if (unit == null) return const SizedBox();
    final unitLabel = unit == ValueUnit.mgdl ? 'mg/dl' : '%';
    return Padding(
      padding: const EdgeInsets.only(left: 2),
      child: Text(
        unitLabel,
        overflow: TextOverflow.clip,
        maxLines: 2,
        style: GoogleFonts.poppins(
          fontSize: unitFontSize ?? 13,
          color: unitColor ?? headingColor,
        ),
      ),
    );
  }

  Widget _buildTag() {
    if (tag == null) return const SizedBox();
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        color: tagBackgroundColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        tag!,
        style: GoogleFonts.poppins(
          color: tagTextColor,
          fontWeight: FontWeight.w600,
          fontSize: tagFontSize ?? 12,
        ),
      ),
    );
  }

  Widget _buildHeading() {
    if (heading == null) return const SizedBox();
    return Text(
      heading!,
      style: GoogleFonts.poppins(
        fontSize: headingFontSize ?? 13,
        fontWeight: FontWeight.w500,
        color: headingColor,
      ),
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      softWrap: true,
    );
  }
}
