import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:fl_chart/fl_chart.dart';

class GlucoseTrackingScreen extends StatefulWidget {
  const GlucoseTrackingScreen({super.key});

  @override
  State<GlucoseTrackingScreen> createState() => _GlucoseTrackingScreenState();
}

class _GlucoseTrackingScreenState extends State<GlucoseTrackingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text('Glucose tracking', style: GoogleFonts.poppins()),
        actions: [IconButton(icon: const Icon(Icons.menu), onPressed: () {})],
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _CurrentGlucoseSection(),
            const SizedBox(height: 16),
            _DailyGraphSection(),
            const SizedBox(height: 16),
            _WeeklyTrendsSection(),
            const SizedBox(height: 16),
            _DailyAveragesSection(),
            const SizedBox(height: 16),
            _TimeInRangePatternsSection(),
            const SizedBox(height: 16),
            _GlucoseLogSection(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddEntryModal(context),
        child: const Icon(Icons.add),
      ),
    );
  }

  void _showAddEntryModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (context) => const _AddEntryModal(),
    );
  }
}

// --- UI Sections ---

class _CurrentGlucoseSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Current glucose',
          style: GoogleFonts.poppins(fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 4),
        Row(
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFFE9F8ED),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                children: [
                  Text(
                    '128',
                    style: GoogleFonts.poppins(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.green[700],
                    ),
                  ),
                  const SizedBox(width: 4),
                  Text(
                    'mg/dL',
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      color: Colors.grey[700],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 12),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                color: const Color(0xFFD6F5E3),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Text(
                'In range',
                style: GoogleFonts.poppins(
                  color: Colors.green[700],
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _DailyGraphSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.calendar_today, size: 18),
              label: Text('Today', style: GoogleFonts.poppins()),
              style: TextButton.styleFrom(foregroundColor: Colors.black),
            ),
            Text(
              'Daily graph',
              style: GoogleFonts.poppins(fontWeight: FontWeight.w500),
            ),
          ],
        ),
        Container(
          height: 120,
          margin: const EdgeInsets.only(top: 8),
          decoration: BoxDecoration(
            color: Colors.grey[100],
            borderRadius: BorderRadius.circular(16),
          ),
          child: const Center(
            child: Text('No data', style: TextStyle(color: Colors.grey)),
          ),
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            _InfoChip(label: 'Average', value: '46 mg/dL'),
            const SizedBox(width: 8),
            _InfoChip(label: 'Time in range', value: '77%'),
          ],
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
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Text(
            label,
            style: GoogleFonts.poppins(fontSize: 12, color: Colors.grey[700]),
          ),
          const SizedBox(width: 4),
          Text(
            value,
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.bold,
              color: Colors.blue,
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
          style: GoogleFonts.poppins(fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            _TrendCard(
              label: 'Average',
              value: '128 mg/dL',
              color: Colors.blue[700]!,
            ),
            const SizedBox(width: 8),
            _TrendCard(
              label: 'Time in range',
              value: '78%',
              color: Colors.green[700]!,
            ),
            const SizedBox(width: 8),
            _TrendCard(
              label: 'Variability',
              value: '14%',
              color: Colors.purple[400]!,
            ),
          ],
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            ChoiceChip(
              label: Text('Week', style: GoogleFonts.poppins()),
              selected: isWeek,
              onSelected: (v) => setState(() => isWeek = true),
            ),
            const SizedBox(width: 8),
            ChoiceChip(
              label: Text('Month', style: GoogleFonts.poppins()),
              selected: !isWeek,
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
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: color.withValues(alpha: 0.08),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            Text(label, style: GoogleFonts.poppins(fontSize: 12, color: color)),
            const SizedBox(height: 4),
            Text(
              value,
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.bold,
                color: color,
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
    // Placeholder bar chart
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Daily averages',
          style: GoogleFonts.poppins(fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 8),
        SizedBox(
          height: 120,
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
                          style: GoogleFonts.poppins(fontSize: 12),
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
                  barRods: [BarChartRodData(toY: 50, color: Colors.blue)],
                ),
                BarChartGroupData(
                  x: 1,
                  barRods: [BarChartRodData(toY: 50, color: Colors.blue)],
                ),
                BarChartGroupData(
                  x: 2,
                  barRods: [BarChartRodData(toY: 80, color: Colors.blue)],
                ),
                BarChartGroupData(
                  x: 3,
                  barRods: [BarChartRodData(toY: 70, color: Colors.blue)],
                ),
                BarChartGroupData(
                  x: 4,
                  barRods: [BarChartRodData(toY: 82, color: Colors.blue)],
                ),
                BarChartGroupData(
                  x: 5,
                  barRods: [BarChartRodData(toY: 50, color: Colors.blue)],
                ),
                BarChartGroupData(
                  x: 6,
                  barRods: [BarChartRodData(toY: 70, color: Colors.blue)],
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
          style: GoogleFonts.poppins(fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: [
            _PatternChip(icon: Icons.wb_sunny, label: 'Morning', value: '85%'),
            _PatternChip(
              icon: Icons.wb_twighlight,
              label: 'Afternoon',
              value: '64%',
            ),
            _PatternChip(
              icon: Icons.nights_stay,
              label: 'Evening',
              value: '50%',
            ),
            _PatternChip(
              icon: Icons.nightlight_round,
              label: 'Night',
              value: '93%',
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
  const _PatternChip({
    required this.icon,
    required this.label,
    required this.value,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 18, color: Colors.amber[700]),
          const SizedBox(width: 4),
          Text(label, style: GoogleFonts.poppins(fontSize: 12)),
          const SizedBox(width: 4),
          Text(
            value,
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),
        ],
      ),
    );
  }
}

class _GlucoseLogSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Glucose log',
          style: GoogleFonts.poppins(fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 8),
        SizedBox(
          height: 180,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              _LogDayChip(day: 'Tue', date: '13'),
              _LogDayChip(day: 'Wed', date: '14'),
              _LogDayChip(day: 'Thu', date: '15'),
              _LogDayChip(day: 'Fri', date: '16', selected: true),
              _LogDayChip(day: 'Sat', date: '17'),
              _LogDayChip(day: 'Sun', date: '18'),
              _LogDayChip(day: 'Sat', date: '19'),
            ],
          ),
        ),
        const SizedBox(height: 8),
        _LogEntry(),
        _LogEntry(),
        _LogEntry(),
      ],
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
    return Container(
      margin: const EdgeInsets.only(right: 8),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: selected ? Colors.black : Colors.grey[100],
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            day,
            style: GoogleFonts.poppins(
              color: selected ? Colors.white : Colors.black,
            ),
          ),
          Text(
            date,
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.bold,
              color: selected ? Colors.white : Colors.black,
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
      margin: const EdgeInsets.symmetric(vertical: 6),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey[200]!),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.breakfast_dining, color: Colors.amber, size: 28),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '7:30 AM',
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    color: Colors.grey[700],
                  ),
                ),
                Text(
                  'Breakfast',
                  style: GoogleFonts.poppins(fontWeight: FontWeight.w500),
                ),
                Text(
                  'Oatmeal with berries',
                  style: GoogleFonts.poppins(fontSize: 13),
                ),
                Text(
                  '52g carbs   65g protein   6g fats',
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    color: Colors.grey[600],
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
                  horizontal: 10,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: Colors.yellow[100],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  '154 mg/dL',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.bold,
                    color: Colors.orange[800],
                    fontSize: 13,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  minimumSize: const Size(40, 28),
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  side: BorderSide(color: Colors.grey[300]!),
                ),
                child: Text('Edit', style: GoogleFonts.poppins(fontSize: 12)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// --- Add Entry Modal ---

class _AddEntryModal extends StatelessWidget {
  const _AddEntryModal();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 16,
        right: 16,
        top: 24,
        bottom: MediaQuery.of(context).viewInsets.bottom + 16,
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
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      foregroundColor: Colors.white,
                      shape: const StadiumBorder(),
                    ),
                    child: Text('Meal', style: GoogleFonts.poppins()),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      shape: const StadiumBorder(),
                    ),
                    child: Text('Activity', style: GoogleFonts.poppins()),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
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
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => Navigator.of(context).pop(),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                foregroundColor: Colors.white,
                minimumSize: const Size.fromHeight(48),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
              ),
              child: Text('Save entry', style: GoogleFonts.poppins()),
            ),
            const SizedBox(height: 8),
            OutlinedButton(
              onPressed: () => Navigator.of(context).pop(),
              style: OutlinedButton.styleFrom(
                minimumSize: const Size.fromHeight(48),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
              ),
              child: Text('Cancel', style: GoogleFonts.poppins()),
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
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: GoogleFonts.poppins(fontSize: 13, color: Colors.grey[700]),
          ),
          const SizedBox(height: 4),
          TextField(
            decoration: InputDecoration(
              hintText: hint,
              filled: true,
              fillColor: Colors.grey[100],
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
