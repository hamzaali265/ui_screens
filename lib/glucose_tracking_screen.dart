import 'package:flutter/material.dart';
import 'package:ui_screens/widgets/custom_appbar.dart';

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
      backgroundColor: const Color(0xFFF9F9F9),
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
