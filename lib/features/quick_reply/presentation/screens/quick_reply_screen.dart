import 'package:digital_defender/core/utils/constants/app_constants.dart';
import 'package:digital_defender/core/utils/constants/constant_functions.dart';
import 'package:digital_defender/di/di_container.dart';
import 'package:digital_defender/features/common/presentation/widgets/common_button.dart';
import 'package:digital_defender/features/common/presentation/widgets/custom_loading.dart';
import 'package:digital_defender/features/common/presentation/widgets/page_title.dart';
import 'package:digital_defender/features/common/presentation/widgets/secondary_button.dart';
import 'package:digital_defender/features/common/presentation/widgets/section_item.dart';
import 'package:digital_defender/features/common/presentation/widgets/social_media_switch.dart';
import 'package:digital_defender/features/common/presentation/widgets/time_indicator.dart';
import 'package:digital_defender/features/post_share/data/model/get_video_params.dart';
import 'package:digital_defender/features/post_share/presentation/bloc/post_bloc.dart';
import 'package:digital_defender/features/post_share/presentation/widgets/controls_overlay.dart';
import 'package:digital_defender/features/post_share/presentation/widgets/fullscreen_player.dart';
import 'package:digital_defender/features/quick_reply/data/models/reply_params.dart';
import 'package:digital_defender/features/quick_reply/presentation/bloc/reply_bloc.dart';
import 'package:digital_defender/features/quick_reply/presentation/widgets/custom_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';

class QuickReplyScreen extends StatefulWidget {
  const QuickReplyScreen({super.key});

  @override
  State<QuickReplyScreen> createState() => _QuickReplyScreenState();
}

class _QuickReplyScreenState extends State<QuickReplyScreen> {
  late VideoPlayerController _controller;

  final ValueNotifier<int> _selectedSocial = ValueNotifier(0);
  XFile? _selectedImage;
  bool startedInitialize = false;
  final PostBloc _postBloc = getIt<PostBloc>();
  final ReplyBloc _replyBloc = getIt<ReplyBloc>();

  @override
  void initState() {
    super.initState();
    _postBloc.add(
      GetVideo(
        GetVideoParams(
          platform: getCorrectSocialMediaName(_selectedSocial.value),
          type: "QUICK_REPLY",
        ),
      ),
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

    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: _postBloc),
        BlocProvider.value(value: _replyBloc),
      ],
      child: MultiBlocListener(listeners: [
        BlocListener<PostBloc, PostState>(listener: (context, state) {
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
        })
      ], child: _buildValueListenableBuilder(textTheme)),
    );
  }

  Widget _buildValueListenableBuilder(TextTheme textTheme) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      color: Colors.white,
      child: SingleChildScrollView(
        child: BlocBuilder<ReplyBloc, ReplyState>(
          builder: (context, state) {
            return ValueListenableBuilder(
                valueListenable: _selectedSocial,
                builder: (context, val, _) {
                  return BlocBuilder<PostBloc, PostState>(
                    builder: (context, postState) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildMediaSwitch(),
                          PageTitle(
                            title: AppLocalizations.of(context)!.quickReplyDesc,
                            icon: Icons.email,
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          _buildVideo(context, colorScheme),
                          _buildSteps(context, postState, val, textTheme)
                        ],
                      );
                    },
                  );
                });
          },
        ),
      ),
    );
  }

  Padding _buildSteps(
      BuildContext context, PostState postState, int val, TextTheme textTheme) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          SectionItem(
            number: "1",
            title: AppLocalizations.of(context)!.reviewContent,
          ),
          const SizedBox(
            height: 4,
          ),
          CustomContainer(
            text: postState.getVideoResponse.desc,
          ),
          const SizedBox(
            height: 16,
          ),
          SectionItem(
            number: "2",
            title:
                "Click on \"Copy content and Reply on ${getCorrectSocialMediaName(val)}\", then paste the reply.",
          ),
          const SizedBox(
            height: 16,
          ),
          CommonButton(
            text:
                "${AppLocalizations.of(context)!.copyContent} ${getCorrectSocialMediaName(val)}",
            onTap: () {
              openUrl(postState.getVideoResponse.webpage);
            },
          ),
          const SizedBox(
            height: 16,
          ),
          SectionItem(
            number: "3",
            title: AppLocalizations.of(context)!.clickOnConfirm,
          ),
          const SizedBox(
            height: 16,
          ),
          SecondaryButton(
            text: AppLocalizations.of(context)!.uploadScreenshot,
            onTap: () {
              pickImage();
            },
          ),
          const SizedBox(
            height: 16,
          ),
          CommonButton(
            text: AppLocalizations.of(context)!.confirmReply,
            onTap: () {
              _replyBloc.add(
                const QuickReply(
                  ReplyParams(),
                ),
              );
            },
          ),
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
            onTap: () {},
          ),
        ],
      ),
    );
  }

  Padding _buildMediaSwitch() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SocialMediaSwitch(
        selectedButtonNotifier: _selectedSocial,
        onChange: () {
          _postBloc.add(
            GetVideo(
              GetVideoParams(
                platform: getCorrectSocialMediaName(_selectedSocial.value),
                type: "QUICK_REPLY",
              ),
            ),
          );
        },
      ),
    );
  }

  void pickImage() async {
    final ImagePicker picker = ImagePicker();
    _selectedImage = await picker.pickImage(source: ImageSource.gallery);
    logger.d(_selectedImage?.path);
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
                      child: TimeIndicator(controller: _controller),
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
}
