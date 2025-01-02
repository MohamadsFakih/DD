import 'package:digital_defender/core/utils/constants/app_constants.dart';
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
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:image_picker/image_picker.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ReportScreen extends StatefulWidget {
  const ReportScreen({super.key});

  @override
  State<ReportScreen> createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {
  final ValueNotifier<int> _selectedSocial = ValueNotifier(0);
  XFile? _selectedImage;
  bool startedInitialize = false;
  final CommonBloc _commonBloc = getIt<CommonBloc>();

  @override
  void initState() {
    super.initState();
    _commonBloc.add(
      GetVideo(2, _selectedSocial.value),
    );
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: _commonBloc),
      ],
      child: MultiBlocListener(
        listeners: [
          BlocListener<CommonBloc, CommonState>(listener: (context, state) {
            if (state.videoResponse.link.isNotEmpty) {
              setState(() {
                startedInitialize = true;
              });
            }
          })
        ],
        child: _buildValueListenableBuilder(textTheme),
      ),
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
                builder: (context, state) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildMediaSwitch(),
                      const PageTitle(
                        title:
                            "Defend the truth by reporting any content that misrepresents or harms Palestine's image",
                        icon: Icons.info,
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      state.isLoading
                          ? const CustomLoading()
                          : _buildVideo(
                              context,
                              colorScheme,
                              state.videoResponse.link,
                              state.videoResponse.socialType,
                              textTheme,
                            ),
                      if (state.videoResponse.link.isNotEmpty)
                        _buildSteps(context, state, val, textTheme)
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
          const SectionItem(
            number: "1",
            title: "Open the post by clicking the button below.",
          ),
          const SizedBox(
            height: 4,
          ),
          const SectionItem(
            number: "2",
            title:
                "Tap the three dots icon (⋯) located at the top of the post.",
          ),
          const SizedBox(
            height: 16,
          ),
          const SizedBox(
            height: 16,
          ),
          const SectionItem(
            number: "3",
            title: "Click 'Report'.",
          ),
          const SizedBox(
            height: 16,
          ),
          const SectionItem(
            number: "4",
            title: "Select ‘Hate speech or symbols’ as type of issue.",
          ),
          const SizedBox(
            height: 16,
          ),
          const SectionItem(
            number: "5",
            title: "Click ‘Submit report’.",
          ),
          const SizedBox(
            height: 16,
          ),
          const SectionItem(
            number: "6",
            title: "Confirm Report to confirm that you reported the post.",
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
                GetVideo(2, _selectedSocial.value),
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
            GetVideo(2, _selectedSocial.value),
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
