import 'package:digital_defender/core/utils/constants/app_constants.dart';
import 'package:digital_defender/core/utils/constants/constant_functions.dart';
import 'package:digital_defender/di/di_container.dart';
import 'package:digital_defender/features/common/data/models/send_activity_params.dart';
import 'package:digital_defender/features/common/presentation/bloc/common_bloc.dart';
import 'package:digital_defender/features/common/presentation/widgets/common_button.dart';
import 'package:digital_defender/features/common/presentation/widgets/custom_loading.dart';
import 'package:digital_defender/features/common/presentation/widgets/page_title.dart';
import 'package:digital_defender/features/common/presentation/widgets/secondary_button.dart';
import 'package:digital_defender/features/common/presentation/widgets/section_item.dart';
import 'package:digital_defender/features/common/presentation/widgets/social_media_switch.dart';
import 'package:digital_defender/features/common/presentation/widgets/video_unavailable.dart';
import 'package:digital_defender/features/quick_reply/presentation/widgets/custom_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';
import 'package:webview_flutter/webview_flutter.dart';

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
        child: ValueListenableBuilder(
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
                      postState.isLoading
                          ? const CustomLoading()
                          : _buildVideo(
                              context,
                              colorScheme,
                              postState.videoResponse.link,
                              postState.videoResponse.socialType,
                              textTheme,
                            ),
                      if (postState.videoResponse.link.isNotEmpty)
                        _buildSteps(context, postState, val, textTheme)
                    ],
                  );
                },
              );
            }),
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
            onTap: () async {
              await Clipboard.setData(
                ClipboardData(text: postState.videoResponse.content),
              );
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
              _commonBloc.add(
                SendActivity(
                  SendActivityParams(
                    socialType: _selectedSocial.value,
                    type: 1,
                  ),
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
            onTap: () {
              _commonBloc.add(
                GetVideo(1, _selectedSocial.value),
              );
            },
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
      int socialType, TextTheme textTheme) {
    if (link.isNotEmpty) {
      final controller = WebViewController()
        ..setJavaScriptMode(JavaScriptMode.unrestricted)
        ..setNavigationDelegate(
          NavigationDelegate(
            onProgress: (int progress) {
              // Update loading bar.
            },
            onPageStarted: (String url) {},
            onPageFinished: (String url) {},
            onHttpError: (HttpResponseError error) {},
            onWebResourceError: (WebResourceError error) {},
            onNavigationRequest: (NavigationRequest request) {
              if (request.url.startsWith('https://www.youtube.com/')) {
                return NavigationDecision.prevent;
              }
              return NavigationDecision.navigate;
            },
          ),
        )
        ..loadRequest(Uri.parse(link));
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: 750,
          child: WebViewWidget(
            controller: controller,
          ),
        ),
      );
    } else {
      return const VideoUnavailable();
    }
  }
}
