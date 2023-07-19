import 'package:flutter/material.dart';

class ReleasDate extends StatelessWidget {
  final String releasDate;
  final Color? color;
  const ReleasDate({
    required this.releasDate,
    super.key,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 2.0,
        horizontal: 8.0,
      ),
      decoration: BoxDecoration(
        color: color,
        // Colors.grey[800],
        borderRadius: BorderRadius.circular(4.0),
      ),
      child: Text(
        releasDate.split('-')[0],
        style: const TextStyle(
          fontSize: 16.0,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
