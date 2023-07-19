import 'package:flutter/material.dart';

class VoteAverage extends StatelessWidget {
  final double voteAverage;
  const VoteAverage({
    required this.voteAverage,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          Icons.star,
          color: Colors.amber,
          size: 20.0,
        ),
        const SizedBox(width: 4.0),
        Text(
          ("$voteAverage "),
          style: const TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.w500,
            letterSpacing: 1.2,
          ),
        ),
        const SizedBox(width: 4.0),
        Text(
          '("$voteAverage")',
          style: const TextStyle(
            fontSize: 1.0,
            fontWeight: FontWeight.w500,
            letterSpacing: 1.2,
          ),
        ),
      ],
    );
  }
}
