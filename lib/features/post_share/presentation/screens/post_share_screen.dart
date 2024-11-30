import 'package:digital_defender/core/utils/constants/app_constants.dart';
import 'package:digital_defender/core/utils/constants/constant_functions.dart';
import 'package:digital_defender/features/post_share/presentation/widgets/controls_overlay.dart';
import 'package:digital_defender/features/post_share/presentation/widgets/fullscreen_player.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
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
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.share,
                          size: 34,
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Text(
                              AppLocalizations.of(context)!.postShareDesc,
                              style: textTheme.labelLarge
                                  ?.copyWith(color: Colors.black),
                              textAlign: TextAlign.center,
                              maxLines: 4,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  state.isVideoLoading
                      ? const CustomLoading()
                      : _buildVideo(context, colorScheme),
                  const SizedBox(
                    height: 16,
                  ),
                  _buildSections(context, state, textTheme),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Padding _buildSections(
      BuildContext context, PostState state, TextTheme textTheme) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        children: [
          SectionItem(
            number: "1",
            title: AppLocalizations.of(context)!.downloadContentToPublish,
          ),
          const SizedBox(
            height: 8,
          ),
          CommonButton(
            text: AppLocalizations.of(context)!.downloadContent,
            icon: Icons.download,
            onTap: () {
              saveVideo(state.getVideoResponse.link);
            },
          ),
          const SizedBox(
            height: 16,
          ),
          SectionItem(
            number: "2",
            title: AppLocalizations.of(context)!.pastUrl,
          ),
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
              style: textTheme.bodyLarge?.copyWith(color: Colors.black),
              decoration: InputDecoration(
                hintText: AppLocalizations.of(context)!.facebookUrl,
                prefixIcon: const Icon(Icons.link),
              ),
            ),
          ),
          const SizedBox(
            height: 32,
          ),
          _buildConfirmButton(),
          const SizedBox(
            height: 8,
          ),
          Text(
            AppLocalizations.of(context)!.orText,
            style: textTheme.labelLarge?.copyWith(
              color: Colors.black,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          CommonButton(
            text: AppLocalizations.of(context)!.getAnotherPost,
            backgroundColor: Colors.grey,
            textColor: Colors.black,
            onTap: () {
              _postBloc.add(
                const GetVideo(),
              );
            },
          ),
        ],
      ),
    );
  }

  ValueListenableBuilder<bool> _buildConfirmButton() {
    return ValueListenableBuilder(
        valueListenable: _enabled,
        builder: (context, val, _) {
          return CommonButton(
            text: AppLocalizations.of(context)!.confirmPost,
            enabled: _linkController.text.trim().isNotEmpty,
            onTap: () {
              _postBloc.add(
                PostVideo(
                  _linkController.text.trim(),
                ),
              );
            },
          );
        });
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
                    ControlsOverlay(controller: _controller),
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
                          value.isPlaying
                              ? _controller.pause()
                              : _controller.play();
                        },
                      );
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.fullscreen),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              FullScreenVideoPlayer(controller: _controller),
                        ),
                      );
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
