import 'package:flutter/material.dart';
import 'package:ui_screens/enums.dart';

import 'package:ui_screens/widgets/custom_appbar.dart';
import 'package:ui_screens/widgets/value_with_tag_or_percentage_widget.dart';

import 'widgets/add_entry_model.dart';
import 'widgets/current_glucose_section.dart';
import 'widgets/daily_average_section.dart';
import 'widgets/daily_graph_section.dart';
import 'widgets/glucose_log_section.dart';
import 'widgets/time_range_pattern_section.dart';
import 'widgets/weekly_trend_section.dart';

class GlucoseTrackingScreen extends StatefulWidget {
  const GlucoseTrackingScreen({super.key});

  @override
  State<GlucoseTrackingScreen> createState() => _GlucoseTrackingScreenState();
}

class _GlucoseTrackingScreenState extends State<GlucoseTrackingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomAppBar(title: 'Glucose tracking'),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CurrentGlucoseSection(),
            const SizedBox(height: 24),
            DailyGraphSection(),
            const SizedBox(height: 24),
            WeeklyTrendsSection(),
            const SizedBox(height: 24),
            DailyAveragesSection(),
            const SizedBox(height: 24),
            TimeInRangePatternsSection(),
            const SizedBox(height: 24),
            GlucoseLogSection(),
            ValueWithTagOrPercentageWidget(
              heading: 'Average',
              value: '46',
              unit: ValueUnit.mgdl,
              valueColor: const Color(0xFF377DFF),
            ),
            ValueWithTagOrPercentageWidget(
              heading: 'Time in range',
              value: '77',
              unit: ValueUnit.percentage,
              valueColor: const Color(0xFF377DFF),
            ),
            ValueWithTagOrPercentageWidget(
              leadingIcon: Icons.wb_sunny_outlined,
              heading: 'Morning',
              value: '85',
              unit: ValueUnit.percentage,
              valueColor: const Color(0xFFFAB91C),
            ),
            ValueWithTagOrPercentageWidget(
              heading: "Average",
              value: "46",
              unit: ValueUnit.mgdl,
              backgroundColor: Colors.white,
            ),
            ValueWithTagOrPercentageWidget(
              heading: "Average",
              value: "128",
              unit: ValueUnit.mgdl,
              showColumnLayout: true,
            ),
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
      builder: (context) => const AddEntryModal(),
    );
  }
}
