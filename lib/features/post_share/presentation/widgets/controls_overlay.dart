import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class ControlsOverlay extends StatelessWidget {
  const ControlsOverlay({super.key, required this.controller});
  final VideoPlayerController controller;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: controller,
      builder: (context, VideoPlayerValue value, child) {
        return AnimatedOpacity(
          opacity: value.isPlaying ? 0 : 1, // Hide overlay when playing
          duration: const Duration(milliseconds: 300),
          child: Container(
            color: Colors.black.withOpacity(0.5), // Dimmed overlay
            child: Center(
              child: IconButton(
                icon: Icon(
                  value.isPlaying ? Icons.pause : Icons.play_arrow,
                  size: 100,
                  color: Colors.white.withOpacity(0.7),
                ),
                onPressed: () {
                  value.isPlaying ? controller.pause() : controller.play();
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
