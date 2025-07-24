import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:ui_screens/widgets/log_entry.dart';
import 'package:table_calendar/table_calendar.dart';

class GlucoseLogSection extends StatefulWidget {
  const GlucoseLogSection({super.key});

  @override
  State<GlucoseLogSection> createState() => _GlucoseLogSectionState();
}

class _GlucoseLogSectionState extends State<GlucoseLogSection> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  @override
  void initState() {
    super.initState();
    _selectedDay = _focusedDay;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Glucose log',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 10),
        TableCalendar(
          firstDay: DateTime.utc(2020, 1, 1),
          lastDay: DateTime.utc(2030, 12, 31),
          focusedDay: _focusedDay,
          selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
          calendarFormat: CalendarFormat.week,
          headerVisible: false,
          daysOfWeekVisible: false,
          onDaySelected: (selectedDay, focusedDay) {
            setState(() {
              _selectedDay = selectedDay;
              _focusedDay = focusedDay;
            });
          },
          calendarBuilders: CalendarBuilders(
            defaultBuilder: (context, day, focusedDay) =>
                _buildPillDay(day, false),
            selectedBuilder: (context, day, focusedDay) =>
                _buildPillDay(day, true),
            todayBuilder: (context, day, focusedDay) =>
                _buildPillDay(day, false),
            outsideBuilder: (context, day, focusedDay) =>
                const SizedBox.shrink(),
          ),
          rowHeight: 80,
          availableGestures: AvailableGestures.horizontalSwipe,
        ),
        const SizedBox(height: 14),
        LogEntry(),
        LogEntry(),
        LogEntry(),
      ],
    );
  }

  Widget _buildPillDay(DateTime day, bool selected) {
    final Color bgColor = selected ? Colors.black : const Color(0xFFF5F5F5);
    final Color borderColor = selected
        ? Colors.transparent
        : const Color(0xFFEAEAEA);
    final Color dayColor = selected
        ? Colors.white
        : Colors.black.withValues(alpha: 0.2);
    final Color dateColor = selected
        ? Colors.white
        : Colors.black.withValues(alpha: 0.3);

    return Container(
      width: 48,
      height: 72,
      margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: borderColor, width: 1.5),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            DateFormat('E').format(day),
            style: GoogleFonts.poppins(
              color: dayColor,
              fontWeight: FontWeight.w600,
              fontSize: 15,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            '${day.day}',
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.bold,
              color: dateColor,
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }
}
