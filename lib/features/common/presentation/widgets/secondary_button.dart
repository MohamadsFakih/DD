import 'package:flutter/material.dart';

class SecondaryButton extends StatelessWidget {
  const SecondaryButton({super.key, required this.text, required this.onTap});

  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white, // Background color
        side: const BorderSide(color: Colors.green, width: 2.0), // Green border
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0), // Rounded corners
        ),
        elevation: 4.0, // Shadow effect
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.black, // Text color
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
