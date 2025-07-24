import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

class GlucoseTrackingScreen extends StatefulWidget {
  const GlucoseTrackingScreen({super.key});

  @override
  State<GlucoseTrackingScreen> createState() => _GlucoseTrackingScreenState();
}

class _GlucoseTrackingScreenState extends State<GlucoseTrackingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F9),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.black,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          'Glucose tracking',
          style: GoogleFonts.poppins(
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.menu, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _CurrentGlucoseSection(),
            const SizedBox(height: 24),
            _DailyGraphSection(),
            const SizedBox(height: 24),
            _WeeklyTrendsSection(),
            const SizedBox(height: 24),
            _DailyAveragesSection(),
            const SizedBox(height: 24),
            _TimeInRangePatternsSection(),
            const SizedBox(height: 24),
            _GlucoseLogSection(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        onPressed: () => _showAddEntryModal(context),
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }

  void _showAddEntryModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (context) => const _AddEntryModal(),
    );
  }
}

class _CurrentGlucoseSection extends StatelessWidget {
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
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: const Color(0xFFEAEAEA)),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.04),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Row(
            children: [
              Text(
                '128',
                style: GoogleFonts.poppins(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF2DBB6C),
                ),
              ),
              const SizedBox(width: 4),
              Text(
                'mg/dL',
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  color: Colors.grey[700],
                  fontWeight: FontWeight.w500,
                ),
              ),
              const Spacer(),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 5,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFFE9F8ED),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  'In range',
                  style: GoogleFonts.poppins(
                    color: const Color(0xFF2DBB6C),
                    fontWeight: FontWeight.w600,
                    fontSize: 13,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _DailyGraphSection extends StatefulWidget {
  @override
  State<_DailyGraphSection> createState() => _DailyGraphSectionState();
}

class _DailyGraphSectionState extends State<_DailyGraphSection> {
  String _selectedRange = 'Today';
  final List<String> _ranges = ['Today', 'Month', 'Year'];

  @override
  Widget build(BuildContext context) {
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
                    color: Colors.grey.withOpacity(0.03),
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
              // Vertical grid lines
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
              // No data text
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
              // Time labels
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
      ],
    );
  }
}

class _InfoChip extends StatelessWidget {
  final String label;
  final String value;
  const _InfoChip({required this.label, required this.value});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: const Color(0xFFF5F5F5),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Text(
            label,
            style: GoogleFonts.poppins(
              fontSize: 12,
              color: Colors.grey[700],
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(width: 4),
          Text(
            value,
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.bold,
              color: const Color(0xFF2D8CFF),
              fontSize: 13,
            ),
          ),
        ],
      ),
    );
  }
}

class _WeeklyTrendsSection extends StatefulWidget {
  @override
  State<_WeeklyTrendsSection> createState() => _WeeklyTrendsSectionState();
}

class _WeeklyTrendsSectionState extends State<_WeeklyTrendsSection> {
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
            _TrendCard(
              label: 'Average',
              value: '128 mg/dL',
              color: const Color(0xFF2D8CFF),
            ),
            const SizedBox(width: 8),
            _TrendCard(
              label: 'Time in range',
              value: '78%',
              color: const Color(0xFF2DBB6C),
            ),
            const SizedBox(width: 8),
            _TrendCard(
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

class _TrendCard extends StatelessWidget {
  final String label;
  final String value;
  final Color color;
  const _TrendCard({
    required this.label,
    required this.value,
    required this.color,
  });
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 14),
        decoration: BoxDecoration(
          color: color.withOpacity(0.08),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            Text(
              label,
              style: GoogleFonts.poppins(
                fontSize: 12,
                color: color,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              value,
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.bold,
                color: color,
                fontSize: 15,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _DailyAveragesSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Daily averages',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: 110,
          child: BarChart(
            BarChartData(
              alignment: BarChartAlignment.spaceAround,
              maxY: 100,
              barTouchData: BarTouchData(enabled: false),
              titlesData: FlTitlesData(
                leftTitles: AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
                rightTitles: AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
                topTitles: AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    getTitlesWidget: (value, meta) {
                      const days = [
                        'Sun',
                        'Mon',
                        'Tue',
                        'Wed',
                        'Thu',
                        'Fri',
                        'Sat',
                      ];
                      return Padding(
                        padding: const EdgeInsets.only(top: 4),
                        child: Text(
                          days[value.toInt()],
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                            color: Colors.grey[700],
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              borderData: FlBorderData(show: false),
              barGroups: [
                BarChartGroupData(
                  x: 0,
                  barRods: [
                    BarChartRodData(toY: 50, color: const Color(0xFF2D8CFF)),
                  ],
                ),
                BarChartGroupData(
                  x: 1,
                  barRods: [
                    BarChartRodData(toY: 50, color: const Color(0xFF2D8CFF)),
                  ],
                ),
                BarChartGroupData(
                  x: 2,
                  barRods: [
                    BarChartRodData(toY: 80, color: const Color(0xFF2D8CFF)),
                  ],
                ),
                BarChartGroupData(
                  x: 3,
                  barRods: [
                    BarChartRodData(toY: 70, color: const Color(0xFF2D8CFF)),
                  ],
                ),
                BarChartGroupData(
                  x: 4,
                  barRods: [
                    BarChartRodData(toY: 82, color: const Color(0xFF2D8CFF)),
                  ],
                ),
                BarChartGroupData(
                  x: 5,
                  barRods: [
                    BarChartRodData(toY: 50, color: const Color(0xFF2D8CFF)),
                  ],
                ),
                BarChartGroupData(
                  x: 6,
                  barRods: [
                    BarChartRodData(toY: 70, color: const Color(0xFF2D8CFF)),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _TimeInRangePatternsSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
            _PatternChip(
              icon: Icons.wb_sunny,
              label: 'Morning',
              value: '85%',
              color: const Color(0xFFFFC542),
            ),
            _PatternChip(
              icon: Icons.wb_twilight,
              label: 'Afternoon',
              value: '64%',
              color: const Color(0xFF6C63FF),
            ),
            _PatternChip(
              icon: Icons.nights_stay,
              label: 'Evening',
              value: '50%',
              color: const Color(0xFF2D8CFF),
            ),
            _PatternChip(
              icon: Icons.nightlight_round,
              label: 'Night',
              value: '93%',
              color: const Color(0xFF2DBB6C),
            ),
          ],
        ),
      ],
    );
  }
}

class _PatternChip extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final Color color;
  const _PatternChip({
    required this.icon,
    required this.label,
    required this.value,
    required this.color,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFEAEAEA)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.04),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 18, color: color),
          const SizedBox(width: 6),
          Text(
            label,
            style: GoogleFonts.poppins(
              fontSize: 13,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          ),
          const SizedBox(width: 6),
          Text(
            value,
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.bold,
              color: color,
              fontSize: 13,
            ),
          ),
        ],
      ),
    );
  }
}

class _GlucoseLogSection extends StatefulWidget {
  @override
  State<_GlucoseLogSection> createState() => _GlucoseLogSectionState();
}

class _GlucoseLogSectionState extends State<_GlucoseLogSection> {
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
        _LogEntry(),
        _LogEntry(),
        _LogEntry(),
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
        : Colors.black.withOpacity(0.2);
    final Color dateColor = selected
        ? Colors.white
        : Colors.black.withOpacity(0.3);

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

class _LogDayChip extends StatelessWidget {
  final String day;
  final String date;
  final bool selected;
  const _LogDayChip({
    required this.day,
    required this.date,
    this.selected = false,
  });
  @override
  Widget build(BuildContext context) {
    final Color bgColor = selected ? Colors.black : const Color(0xFFF5F5F5);
    final Color textColor = selected
        ? Colors.white
        : Colors.black.withOpacity(0.5);
    final Color dateColor = selected
        ? Colors.white
        : Colors.black.withOpacity(0.7);

    return Container(
      margin: const EdgeInsets.only(right: 10),
      width: 48,
      height: 72,
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: Colors.transparent),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            day,
            style: GoogleFonts.poppins(
              color: textColor,
              fontWeight: FontWeight.w500,
              fontSize: 15,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            date,
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

class _LogEntry extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFEAEAEA)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.04),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            Icons.breakfast_dining,
            color: const Color(0xFFFFC542),
            size: 28,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '7:30 AM',
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    color: Colors.grey[500],
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  'Breakfast',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600,
                    fontSize: 15,
                    color: Colors.black,
                  ),
                ),
                Text(
                  'Oatmeal with berries',
                  style: GoogleFonts.poppins(fontSize: 13, color: Colors.black),
                ),
                const SizedBox(height: 2),
                Text(
                  '52g carbs   65g protein   6g fats',
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    color: Colors.grey[600],
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFFFFF7E0),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  '154 mg/dL',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFFFFA726),
                    fontSize: 13,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  minimumSize: const Size(40, 28),
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  side: const BorderSide(color: Color(0xFFEAEAEA)),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  'Edit',
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _AddEntryModal extends StatelessWidget {
  const _AddEntryModal();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 20,
        right: 20,
        top: 24,
        bottom: MediaQuery.of(context).viewInsets.bottom + 20,
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Add new entry',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.close, color: Colors.black),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.restaurant,
                      size: 18,
                      color: Colors.white,
                    ),
                    label: Text(
                      'Meal',
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      shape: const StadiumBorder(),
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      elevation: 0,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.directions_run,
                      size: 18,
                      color: Colors.black,
                    ),
                    label: Text(
                      'Activity',
                      style: GoogleFonts.poppins(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    style: OutlinedButton.styleFrom(
                      shape: const StadiumBorder(),
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      side: const BorderSide(color: Color(0xFFEAEAEA)),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 18),
            _EntryField(label: 'Time', hint: '12:30 PM'),
            _EntryField(
              label: 'Glucose reading (mg/dL)',
              hint: 'Enter glucose reading',
            ),
            _EntryField(label: 'Description', hint: 'What did you eat?'),
            _EntryField(
              label: 'Carbohydrates (gr)',
              hint: 'Enter carbs amount',
            ),
            _EntryField(label: 'Protein (gr)', hint: 'Enter protein amount'),
            _EntryField(label: 'Fats (gr)', hint: 'Enter fats amount'),
            const SizedBox(height: 18),
            ElevatedButton(
              onPressed: () => Navigator.of(context).pop(),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                foregroundColor: Colors.white,
                minimumSize: const Size.fromHeight(48),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
                elevation: 0,
              ),
              child: Text(
                'Save entry',
                style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
              ),
            ),
            const SizedBox(height: 10),
            OutlinedButton(
              onPressed: () => Navigator.of(context).pop(),
              style: OutlinedButton.styleFrom(
                minimumSize: const Size.fromHeight(48),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
                side: const BorderSide(color: Color(0xFFEAEAEA)),
              ),
              child: Text(
                'Cancel',
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _EntryField extends StatelessWidget {
  final String label;
  final String hint;
  const _EntryField({required this.label, required this.hint});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: GoogleFonts.poppins(
              fontSize: 13,
              color: Colors.grey[700],
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 4),
          TextField(
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: GoogleFonts.poppins(
                color: Colors.grey[400],
                fontSize: 14,
              ),
              filled: true,
              fillColor: const Color(0xFFF5F5F5),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 14,
                vertical: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
