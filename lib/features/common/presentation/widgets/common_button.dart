import 'package:flutter/material.dart';

class CommonButton extends StatelessWidget {
  const CommonButton({
    super.key,
    required this.text,
    this.icon,
    required this.onTap,
    this.backgroundColor,
    this.textColor,
    this.enabled,
  });
  final String text;
  final IconData? icon;
  final VoidCallback onTap;
  final Color? backgroundColor;
  final Color? textColor;
  final bool? enabled;
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return ElevatedButton(
      onPressed: () {
        if (enabled ?? true) {
          onTap.call();
        }
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: (enabled ?? true)
            ? backgroundColor ?? Colors.green
            : Colors.green.shade200,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        // overlayColor: (enabled ?? true) ? Colors.grey : Colors.transparent,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[
            Icon(
              icon,
              color: Colors.black,
            ),
            const SizedBox(
              width: 4,
            ),
          ],
          Text(
            text,
            style: textTheme.labelLarge
                ?.copyWith(color: textColor ?? Colors.white),
          ),
        ],
      ),
    );
  }
}
