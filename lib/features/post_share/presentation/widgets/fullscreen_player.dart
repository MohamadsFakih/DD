import 'package:digital_defender/features/post_share/presentation/widgets/controls_overlay.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class FullScreenVideoPlayer extends StatelessWidget {
  const FullScreenVideoPlayer({super.key, required this.controller});

  final VideoPlayerController controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            // Video player with aspect ratio
            AspectRatio(
              aspectRatio: controller.value.aspectRatio,
              child: VideoPlayer(controller),
            ),
            // Controls overlay for play/pause functionality
            ControlsOverlay(controller: controller),
            // Additional controls (timeline, time indicator, fullscreen exit)
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  VideoProgressIndicator(
                    controller,
                    allowScrubbing: true,
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: ValueListenableBuilder(
                      valueListenable: controller,
                      builder: (context, VideoPlayerValue value, child) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // Play/Pause Button
                            IconButton(
                              icon: Icon(
                                value.isPlaying
                                    ? Icons.pause
                                    : Icons.play_arrow,
                                color: Colors.white,
                              ),
                              onPressed: () {
                                value.isPlaying
                                    ? controller.pause()
                                    : controller.play();
                              },
                            ),
                            // Time Indicator
                            Text(
                              _buildTimeIndicator(value),
                              style: const TextStyle(color: Colors.white),
                            ),
                            // Fullscreen Exit Button
                            IconButton(
                              icon: const Icon(
                                Icons.fullscreen_exit,
                                color: Colors.white,
                              ),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _buildTimeIndicator(VideoPlayerValue value) {
    final position = value.position;
    final duration = value.duration;

    String formatDuration(Duration d) {
      String twoDigits(int n) => n.toString().padLeft(2, '0');
      final minutes = twoDigits(d.inMinutes.remainder(60));
      final seconds = twoDigits(d.inSeconds.remainder(60));
      return '$minutes:$seconds';
    }

    return '${formatDuration(position)} / ${formatDuration(duration)}';
  }
}
