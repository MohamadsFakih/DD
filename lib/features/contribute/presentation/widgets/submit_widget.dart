import 'package:digital_defender/features/common/presentation/widgets/common_button.dart';
import 'package:flutter/material.dart';

class SubmitWidget extends StatelessWidget {
  const SubmitWidget(
      {super.key,
      required this.controller,
      required this.title,
      required this.desc});
  final TextEditingController controller;
  final String title;
  final String desc;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Card(
      color: colorScheme.outline,
      surfaceTintColor: colorScheme.outline,
      child: ExpansionTile(
        shape: Border.all(color: Colors.transparent),
        childrenPadding: const EdgeInsets.all(8),
        title: Text(
          title,
          style: textTheme.titleLarge?.copyWith(color: Colors.black),
        ),
        children: [
          Text(
            desc,
            style: textTheme.labelLarge?.copyWith(color: Colors.black),
          ),
          const SizedBox(
            height: 8,
          ),
          _buildTextField(textTheme, controller),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0),
            child: CommonButton(text: "Submit", onTap: () {}),
          )
        ],
      ),
    );
  }

  Container _buildTextField(
      TextTheme textTheme, TextEditingController controller) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey), // Set border color
        borderRadius: BorderRadius.circular(8.0), // Rounded corners if needed
      ),
      padding: EdgeInsets.zero,
      child: TextField(
        controller: controller,
        style: textTheme.labelMedium?.copyWith(color: Colors.black),
        decoration: const InputDecoration(
          prefixIcon: Icon(Icons.link),
          border: InputBorder.none, // Remove underline
          contentPadding:
              EdgeInsets.symmetric(vertical: 15.0), // Align text and icon
          isDense: true, // Reduce space inside the TextField
        ),
      ),
    );
  }
}
