import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ui_screens/add_entry_modal.dart';
import 'package:ui_screens/current_glucose_section.dart';
import 'package:ui_screens/daily_averages_section.dart';
import 'package:ui_screens/daily_graph_section.dart';
import 'package:ui_screens/glucose_log_section.dart';
import 'package:ui_screens/time_in_range_patterns_section.dart';
import 'package:ui_screens/weekly_trends_section.dart';

// This file will be refactored to only contain the GlucoseTrackingScreen and its state.
// All major widgets will be moved to their own files in lib/ and imported here.
// The usage of each widget will remain the same.

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
