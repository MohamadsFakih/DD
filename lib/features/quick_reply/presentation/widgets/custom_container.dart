import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.green, width: 2.0),
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Content:',
            style: textTheme.titleMedium?.copyWith(color: Colors.black),
          ),
          const SizedBox(height: 8.0),
          Text(
            text,
            style: textTheme.bodyMedium?.copyWith(color: Colors.black),
          ),
        ],
      ),
    );
  }
}
