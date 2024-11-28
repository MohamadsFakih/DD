import 'package:digital_defender/core/utils/constants/app_constants.dart';
import 'package:digital_defender/di/di_container.dart';
import 'package:digital_defender/features/common/presentation/widgets/common_button.dart';
import 'package:digital_defender/features/common/presentation/widgets/custom_loading.dart';
import 'package:digital_defender/features/common/presentation/widgets/section_item.dart';
import 'package:digital_defender/features/post_share/presentation/bloc/post_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:video_player/video_player.dart';

class PostShareScreen extends StatefulWidget {
  const PostShareScreen({super.key});

  @override
  State<PostShareScreen> createState() => _PostShareScreenState();
}

class _PostShareScreenState extends State<PostShareScreen> {
  late VideoPlayerController _controller;
  bool _isFullScreen = false;
  final PostBloc _postBloc = getIt<PostBloc>();
  final TextEditingController _linkController = TextEditingController();
  final ValueNotifier<bool> _enabled = ValueNotifier(false);
  bool startedInitialize = false;
  @override
  void initState() {
    super.initState();
    _postBloc.add(
      const GetVideo(),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    return BlocProvider.value(
      value: _postBloc,
      child: BlocListener<PostBloc, PostState>(
        listener: (context, state) {
          if (state.getVideoResponse.link.isNotEmpty) {
            setState(() {
              startedInitialize = true;
            });
            logger.d(state.getVideoResponse.link);
            _controller = VideoPlayerController.networkUrl(
              Uri.parse(
                state.getVideoResponse.link,
              ),
            )..initialize().then((_) {
                setState(() {});
              });
          }
        },
        child: _buildContainer(textTheme, context, colorScheme),
      ),
    );
  }

  Container _buildContainer(
      TextTheme textTheme, BuildContext context, ColorScheme colorScheme) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: SingleChildScrollView(
          child: BlocBuilder<PostBloc, PostState>(
            builder: (context, state) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      "Distribute our curated content to your network and groups to educate and inform others.",
                      style:
                          textTheme.labelLarge?.copyWith(color: Colors.black),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  state.isVideoLoading
                      ? const CustomLoading()
                      : _buildVideo(context, colorScheme),
                  const SizedBox(
                    height: 16,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Column(
                      children: [
                        const SectionItem(
                            number: "1",
                            title:
                                "Download the content before so you can publish it."),
                        const SizedBox(
                          height: 8,
                        ),
                        CommonButton(
                          text: "Download Content",
                          icon: Icons.download,
                          onTap: () {},
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        const SectionItem(
                            number: "2",
                            title:
                                "Paste the URL of your uploaded content, then click on 'Confirm Post' to confirm that you posted content."),
                        const SizedBox(
                          height: 8,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.85,
                          child: TextField(
                            controller: _linkController,
                            onChanged: (r) {
                              _enabled.value = r.trim().isNotEmpty;
                            },
                            style: textTheme.bodyLarge
                                ?.copyWith(color: Colors.black),
                            decoration: const InputDecoration(
                              hintText: "Facebook post URL",
                              prefixIcon: Icon(Icons.link),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 32,
                        ),
                        ValueListenableBuilder(
                            valueListenable: _enabled,
                            builder: (context, val, _) {
                              return CommonButton(
                                text: "Confirm Post",
                                enabled: _linkController.text.trim().isNotEmpty,
                                onTap: () {
                                  _postBloc.add(
                                    PostVideo(
                                      _linkController.text.trim(),
                                    ),
                                  );
                                },
                              );
                            }),
                        const SizedBox(
                          height: 8,
                        ),
                        Text(
                          "or",
                          style: textTheme.labelLarge
                              ?.copyWith(color: Colors.black),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        CommonButton(
                          text: "Get another post",
                          backgroundColor: Colors.grey,
                          textColor: Colors.black,
                          onTap: () {
                            _postBloc.add(
                              const GetVideo(),
                            );
                          },
                        )
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildVideo(BuildContext context, ColorScheme colorScheme) {
    return startedInitialize
        ? Column(
            children: [
              AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    VideoPlayer(_controller),
                    _ControlsOverlay(controller: _controller),
                    VideoProgressIndicator(
                      _controller,
                      allowScrubbing: true,
                      padding: const EdgeInsets.symmetric(vertical: 4),
                    ),
                    Positioned(
                      bottom: 10,
                      left: 10,
                      child: _buildTimeIndicator(),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ValueListenableBuilder(
                    valueListenable: _controller,
                    builder: (context, VideoPlayerValue value, child) {
                      return IconButton(
                        icon: Icon(
                          value.isPlaying ? Icons.pause : Icons.play_arrow,
                        ),
                        onPressed: () {
                          setState(() {
                            value.isPlaying
                                ? _controller.pause()
                                : _controller.play();
                          });
                        },
                      );
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.fullscreen),
                    onPressed: () {
                      setState(() {
                        _isFullScreen = !_isFullScreen;
                      });
                      if (_isFullScreen) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                FullScreenVideoPlayer(controller: _controller),
                          ),
                        );
                      }
                    },
                  ),
                ],
              ),
            ],
          )
        : const CustomLoading();
  }

  Widget _buildTimeIndicator() {
    // Returns the elapsed time and total duration as a text indicator
    return ValueListenableBuilder(
      valueListenable: _controller,
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
            style: const TextStyle(color: Colors.white, fontSize: 14),
          ),
        );
      },
    );
  }
}

class _ControlsOverlay extends StatelessWidget {
  const _ControlsOverlay({required this.controller});

  final VideoPlayerController controller;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        controller.value.isPlaying ? controller.pause() : controller.play();
      },
      child: Stack(
        children: [
          // Dim background when overlay is visible
          Container(
            color: controller.value.isPlaying
                ? Colors.transparent
                : Colors.black.withOpacity(0.5),
          ),
          // Center play/pause icon
          if (!controller.value.isPlaying)
            Center(
              child: Icon(
                Icons.play_arrow,
                size: 100,
                color: Colors.white.withOpacity(0.7),
              ),
            ),
        ],
      ),
    );
  }
}

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
            _ControlsOverlay(controller: controller),
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
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Play/Pause Button
                        IconButton(
                          icon: Icon(
                            controller.value.isPlaying
                                ? Icons.pause
                                : Icons.play_arrow,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            controller.value.isPlaying
                                ? controller.pause()
                                : controller.play();
                          },
                        ),
                        // Time Indicator
                        Text(
                          _buildTimeIndicator(),
                          style: const TextStyle(color: Colors.white),
                        ),
                        // Fullscreen Exit Button
                        IconButton(
                          icon: const Icon(Icons.fullscreen_exit,
                              color: Colors.white),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ],
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

  String _buildTimeIndicator() {
    final position = controller.value.position;
    final duration = controller.value.duration;

    String formatDuration(Duration d) {
      String twoDigits(int n) => n.toString().padLeft(2, '0');
      final minutes = twoDigits(d.inMinutes.remainder(60));
      final seconds = twoDigits(d.inSeconds.remainder(60));
      return '$minutes:$seconds';
    }

    return '${formatDuration(position)} / ${formatDuration(duration)}';
  }
}
