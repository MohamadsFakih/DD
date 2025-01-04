import 'package:flutter/material.dart';

class BoldStepLine extends StatelessWidget {
  const BoldStepLine({super.key, required this.number, required this.text});
  final String number;
  final Widget text;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          decoration:
              const BoxDecoration(color: Colors.green, shape: BoxShape.circle),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              number,
              style: textTheme.labelLarge,
            ),
          ),
        ),
        const SizedBox(
          width: 8, // Increased spacing for better aesthetics
        ),
        Expanded(
          child: text,
        ),
      ],
    );
  }
}
