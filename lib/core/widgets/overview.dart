import 'package:flutter/material.dart';

class Overview extends StatelessWidget {
  final double? fontSize;
  final String overview;
  const Overview({
    super.key,
    required this.overview,
    required this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      overview,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: FontWeight.w400,
        letterSpacing: 1.2,
      ),
      softWrap: false,
      overflow: TextOverflow.ellipsis,
    );
  }
}
