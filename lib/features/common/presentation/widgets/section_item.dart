import 'package:flutter/material.dart';

class SectionItem extends StatelessWidget {
  const SectionItem({super.key, required this.number, required this.title});
  final String number;
  final String title;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start, // Aligns items at the top
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
          child: Text(
            title,
            style: textTheme.bodyLarge?.copyWith(color: Colors.black),
            maxLines: 4,
            overflow:
                TextOverflow.ellipsis, // Add ellipsis if text exceeds 2 lines
          ),
        ),
      ],
    );
  }
}
