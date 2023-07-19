import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Catogary extends StatelessWidget {
  final String title;
  void Function()? onTap;

  Catogary({
    required this.onTap,
    required this.title,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(10, 10, 10, 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 17,
              letterSpacing: 0.15,
              color: Colors.white,
            ),
          ),
          InkWell(
            onTap: onTap,
            child: const Row(
              children: [
                Text(
                  'See More',
                  style: TextStyle(
                    fontSize: 15,
                    letterSpacing: 0.15,
                    color: Colors.white,
                  ),
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 16.0,
                  color: Colors.white,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
