import 'package:digital_defender/core/utils/constants/image_constants.dart';
import 'package:flutter/material.dart';

class SocialMediaSwitch extends StatefulWidget {
  const SocialMediaSwitch(
      {super.key, required this.selectedButtonNotifier, this.onChange});

  final ValueNotifier<int> selectedButtonNotifier;
  final VoidCallback? onChange;

  @override
  State<SocialMediaSwitch> createState() => _SocialMediaSwitchState();
}

class _SocialMediaSwitchState extends State<SocialMediaSwitch> {
  final List<String> icons = [
    facebookIcon,
    instagramIcon,
    tiktokIcon,
    twitterIcon
  ];
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(icons.length, (index) {
        return ValueListenableBuilder<int>(
          valueListenable: widget.selectedButtonNotifier,
          builder: (context, selectedIndex, child) {
            final bool isSelected = selectedIndex == index;
            return GestureDetector(
              onTap: () {
                widget.selectedButtonNotifier.value = index;
                widget.onChange?.call();
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: isSelected ? Colors.green : Colors.grey[300],
                  shape: BoxShape.circle,
                  boxShadow: isSelected
                      ? [
                          BoxShadow(
                            color: Colors.green.withOpacity(0.5),
                            spreadRadius: 3,
                            blurRadius: 5,
                          )
                        ]
                      : null,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Image.asset(
                    icons[index],
                    width: 30,
                    height: 30,
                  ),
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
