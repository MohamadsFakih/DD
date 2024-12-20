import 'package:digital_defender/core/utils/constants/constant_functions.dart';
import 'package:digital_defender/features/common/presentation/bloc/common_bloc.dart';
import 'package:digital_defender/features/common/presentation/widgets/page_title.dart';
import 'package:digital_defender/features/common/presentation/widgets/social_media_switch.dart';
import 'package:digital_defender/features/common/presentation/widgets/video_unavailable.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:digital_defender/di/di_container.dart';
import 'package:digital_defender/features/common/presentation/widgets/common_button.dart';
import 'package:digital_defender/features/common/presentation/widgets/custom_loading.dart';
import 'package:digital_defender/features/common/presentation/widgets/section_item.dart';
import 'package:digital_defender/features/post_share/presentation/bloc/post_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_social_embeds/social_embed_webview.dart';
import 'package:video_player/video_player.dart';

class PostShareScreen extends StatefulWidget {
  const PostShareScreen({super.key});

  @override
  State<PostShareScreen> createState() => _PostShareScreenState();
}

class _PostShareScreenState extends State<PostShareScreen> {
  late VideoPlayerController _controller;
  final PostBloc _postBloc = getIt<PostBloc>();
  final CommonBloc _commonBloc = getIt<CommonBloc>();
  final TextEditingController _linkController = TextEditingController();
  final ValueNotifier<bool> _enabled = ValueNotifier(false);
  bool startedInitialize = false;
  final ValueNotifier<int> _selectedSocial = ValueNotifier(0);

  @override
  void initState() {
    super.initState();
    _commonBloc.add(
      GetVideo(0, _selectedSocial.value),
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
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: _commonBloc),
        BlocProvider.value(value: _postBloc),
      ],
      child: BlocListener<CommonBloc, CommonState>(
        listener: (context, state) {
          if (state.videoResponse.attachment.isNotEmpty) {
            setState(() {
              startedInitialize = true;
            });
            _controller = VideoPlayerController.networkUrl(
              Uri.parse(
                state.videoResponse.link,
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
                    padding: const EdgeInsets.all(8.0),
                    child: SocialMediaSwitch(
                      selectedButtonNotifier: _selectedSocial,
                      onChange: () {
                        _commonBloc.add(
                          GetVideo(0, _selectedSocial.value),
                        );
                      },
                    ),
                  ),
                  PageTitle(
                    title: AppLocalizations.of(context)!.postShareDesc,
                    icon: Icons.share,
                  ),
                  state.isLoading
                      ? const CustomLoading()
                      : BlocBuilder<CommonBloc, CommonState>(
                          builder: (context, commonState) {
                            return Column(
                              children: [
                                commonState.isLoading
                                    ? const CustomLoading()
                                    : _buildVideo(
                                        context,
                                        colorScheme,
                                        commonState.videoResponse.embed,
                                        commonState.videoResponse.socialType,
                                        textTheme,
                                      ),
                                const SizedBox(
                                  height: 16,
                                ),
                                if (commonState.videoResponse.embed.isNotEmpty)
                                  _buildSections(context, state, textTheme),
                              ],
                            );
                          },
                        ),
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
              // saveVideo(state..link);
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
          ValueListenableBuilder(
              valueListenable: _selectedSocial,
              builder: (context, val, _) {
                return SizedBox(
                  width: MediaQuery.of(context).size.width * 0.85,
                  child: TextField(
                    controller: _linkController,
                    onChanged: (r) {
                      _enabled.value = r.trim().isNotEmpty;
                    },
                    style: textTheme.bodyLarge?.copyWith(color: Colors.black),
                    decoration: InputDecoration(
                      hintText: "${getCorrectSocialMediaName(val)} post url",
                      prefixIcon: const Icon(Icons.link),
                    ),
                  ),
                );
              }),
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
              _commonBloc.add(
                GetVideo(0, _selectedSocial.value),
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

  Widget _buildVideo(BuildContext context, ColorScheme colorScheme, String link,
      int socialType, TextTheme textTheme) {
    if (link.isNotEmpty) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: 750,
          child: SocialEmbed(
            htmlBody: link,
          ),
        ),
      );
    } else {
      return const VideoUnavailable();
    }
  }
}
