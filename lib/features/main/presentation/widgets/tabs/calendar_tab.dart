import 'package:flutter/material.dart';

class CalendarTab extends StatelessWidget {
  const CalendarTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFEAFBF2),
      alignment: Alignment.center,
      child: const Text(
        'Calendar Tab',
        style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
      ),
    );
  }
}
