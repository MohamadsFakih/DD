import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class TimeIndicator extends StatefulWidget {
  const TimeIndicator({super.key, required this.controller});
  final VideoPlayerController controller;

  @override
  State<TimeIndicator> createState() => _TimeIndicatorState();
}

class _TimeIndicatorState extends State<TimeIndicator> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: widget.controller,
      builder: (context, VideoPlayerValue value, child) {
        final duration = value.duration;
        final position = value.position;

        String formatDuration(Duration d) {
          String twoDigits(int n) => n.toString().padLeft(2, '0');
          final minutes = twoDigits(d.inMinutes.remainder(60));
          final seconds = twoDigits(d.inSeconds.remainder(60));
          return '$minutes:$seconds';
        }

        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.6),
            borderRadius: BorderRadius.circular(4),
          ),
          child: Text(
            '${formatDuration(position)} / ${formatDuration(duration)}',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
            ),
          ),
        );
      },
    );
  }
}
