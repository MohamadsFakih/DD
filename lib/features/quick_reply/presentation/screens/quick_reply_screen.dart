import 'package:digital_defender/core/utils/constants/app_constants.dart';
import 'package:digital_defender/core/utils/constants/constant_functions.dart';
import 'package:digital_defender/di/di_container.dart';
import 'package:digital_defender/features/common/presentation/bloc/common_bloc.dart';
import 'package:digital_defender/features/common/presentation/widgets/common_button.dart';
import 'package:digital_defender/features/common/presentation/widgets/page_title.dart';
import 'package:digital_defender/features/common/presentation/widgets/secondary_button.dart';
import 'package:digital_defender/features/common/presentation/widgets/section_item.dart';
import 'package:digital_defender/features/common/presentation/widgets/social_media_switch.dart';
import 'package:digital_defender/features/quick_reply/data/models/reply_params.dart';
import 'package:digital_defender/features/quick_reply/presentation/bloc/reply_bloc.dart';
import 'package:digital_defender/features/quick_reply/presentation/widgets/custom_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_social_embeds/social_embed_webview.dart';
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
  final CommonBloc _commonBloc = getIt<CommonBloc>();
  final ReplyBloc _replyBloc = getIt<ReplyBloc>();

  @override
  void initState() {
    super.initState();
    _commonBloc.add(
      GetVideo(1, _selectedSocial.value),
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
        BlocProvider.value(value: _commonBloc),
        BlocProvider.value(value: _replyBloc),
      ],
      child: MultiBlocListener(listeners: [
        BlocListener<CommonBloc, CommonState>(listener: (context, state) {
          if (state.videoResponse.link.isNotEmpty) {
            setState(() {
              startedInitialize = true;
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
                  return BlocBuilder<CommonBloc, CommonState>(
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
                          _buildVideo(
                              context,
                              colorScheme,
                              postState.videoResponse.embed,
                              postState.videoResponse.socialType),
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

  Padding _buildSteps(BuildContext context, CommonState postState, int val,
      TextTheme textTheme) {
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
            text: postState.videoResponse.content,
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
              openUrl(postState.videoResponse.link);
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
          _commonBloc.add(
            GetVideo(1, _selectedSocial.value),
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

  Widget _buildVideo(BuildContext context, ColorScheme colorScheme, String link,
      int socialType) {
    if (link.isNotEmpty) {
      return SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 300,
        child: SocialEmbed(
          htmlBody: link,
        ),
      );
    } else {
      return Container();
    }
  }
}
