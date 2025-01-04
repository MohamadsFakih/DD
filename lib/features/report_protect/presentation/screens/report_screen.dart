import 'package:digital_defender/core/utils/constants/app_constants.dart';
import 'package:digital_defender/core/utils/constants/constant_functions.dart';
import 'package:digital_defender/di/di_container.dart';
import 'package:digital_defender/features/common/data/models/send_activity_params.dart';
import 'package:digital_defender/features/common/presentation/bloc/common_bloc.dart';
import 'package:digital_defender/features/common/presentation/widgets/common_button.dart';
import 'package:digital_defender/features/common/presentation/widgets/custom_loading.dart';
import 'package:digital_defender/features/common/presentation/widgets/page_title.dart';
import 'package:digital_defender/features/common/presentation/widgets/section_item.dart';
import 'package:digital_defender/features/common/presentation/widgets/social_media_switch.dart';
import 'package:digital_defender/features/common/presentation/widgets/video_unavailable.dart';
import 'package:digital_defender/features/report_protect/widget/bold_step_line.dart';
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
                      PageTitle(
                        title: AppLocalizations.of(context)!.reportDesc,
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

  Padding _buildSteps(
      BuildContext context, CommonState state, int val, TextTheme textTheme) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          SectionItem(
            number: "1",
            title: AppLocalizations.of(context)!.openThePost,
          ),
          const SizedBox(
            height: 4,
          ),
          SectionItem(
            number: "2",
            title: AppLocalizations.of(context)!.tapThreeDots,
          ),
          const SizedBox(
            height: 16,
          ),
          BoldStepLine(
            number: "3",
            text: Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: "${AppLocalizations.of(context)!.click} ",
                    style: textTheme.bodyLarge?.copyWith(color: Colors.black),
                  ),
                  TextSpan(
                    text: "Report",
                    style: textTheme.bodyLarge?.copyWith(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text: ".",
                    style: textTheme.bodyLarge?.copyWith(color: Colors.black),
                  ),
                ],
              ),
              maxLines: 4,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.left,
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          BoldStepLine(
            number: "3",
            text: Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: "${AppLocalizations.of(context)!.select} ",
                    style: textTheme.bodyLarge?.copyWith(color: Colors.black),
                  ),
                  TextSpan(
                    text: "Hate speech or symbols ",
                    style: textTheme.bodyLarge?.copyWith(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text: "as a type of issue.",
                    style: textTheme.bodyLarge?.copyWith(color: Colors.black),
                  ),
                ],
              ),
              maxLines: 4,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.left,
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          BoldStepLine(
            number: "3",
            text: Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: "${AppLocalizations.of(context)!.click} ",
                    style: textTheme.bodyLarge?.copyWith(color: Colors.black),
                  ),
                  TextSpan(
                    text: "Submit report",
                    style: textTheme.bodyLarge?.copyWith(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text: ".",
                    style: textTheme.bodyLarge?.copyWith(color: Colors.black),
                  ),
                ],
              ),
              maxLines: 4,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.left,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          CommonButton(
            text:
                "Report on ${getCorrectSocialMediaName(_selectedSocial.value)}",
            onTap: () {
              openUrl(state.videoResponse.link);
            },
          ),
          const SizedBox(
            height: 16,
          ),
          SectionItem(
            number: "6",
            title: AppLocalizations.of(context)!.confirmReportDesc,
          ),
          const SizedBox(
            height: 16,
          ),
          CommonButton(
            backgroundColor: Colors.red,
            textColor: Colors.white,
            text: AppLocalizations.of(context)!.confirmReport,
            onTap: () {
              _commonBloc.add(
                SendActivity(
                  SendActivityParams(
                    socialType: _selectedSocial.value,
                    type: 2,
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
