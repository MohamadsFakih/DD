import 'package:digital_defender/core/utils/constants/app_constants.dart';
import 'package:digital_defender/core/utils/constants/constant_functions.dart';
import 'package:digital_defender/features/common/presentation/widgets/common_button.dart';
import 'package:digital_defender/features/common/presentation/widgets/page_title.dart';
import 'package:digital_defender/features/common/presentation/widgets/secondary_button.dart';
import 'package:digital_defender/features/common/presentation/widgets/section_item.dart';
import 'package:digital_defender/features/common/presentation/widgets/social_media_switch.dart';
import 'package:digital_defender/features/quick_reply/presentation/widgets/custom_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:image_picker/image_picker.dart';

class QuickReplyScreen extends StatefulWidget {
  const QuickReplyScreen({super.key});

  @override
  State<QuickReplyScreen> createState() => _QuickReplyScreenState();
}

class _QuickReplyScreenState extends State<QuickReplyScreen> {
  final ValueNotifier<int> _selectedSocial = ValueNotifier(0);
  XFile? _selectedImage;
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return _buildValueListenableBuilder(textTheme);
  }

  Widget _buildValueListenableBuilder(TextTheme textTheme) {
    return SingleChildScrollView(
      child: ValueListenableBuilder(
          valueListenable: _selectedSocial,
          builder: (context, val, _) {
            return Container(
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SocialMediaSwitch(
                      selectedButtonNotifier: _selectedSocial,
                    ),
                  ),
                  const PageTitle(
                    title:
                        "Use our ready-made responses to quickly engage in online discussions about Palestine.",
                    icon: Icons.email,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        const SectionItem(
                          number: "1",
                          title: "Review the content below.",
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        const CustomContainer(
                          text: "Oggi la mamma di Martina ci cucina qualcosa",
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
                              "Copy content and reply on ${getCorrectSocialMediaName(val)}",
                          onTap: () {},
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        const SectionItem(
                          number: "3",
                          title:
                              "Click on \"Confirm Reply\" to confirm that you posted a quick reply.",
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        SecondaryButton(
                          text: "Upload screenshot (optional)",
                          onTap: () {
                            pickImage();
                          },
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        CommonButton(
                          text: "Confirm Reply",
                          onTap: () {},
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
                  )
                ],
              ),
            );
          }),
    );
  }

  void pickImage() async {
    final ImagePicker picker = ImagePicker();
    _selectedImage = await picker.pickImage(source: ImageSource.gallery);
    logger.d(_selectedImage?.path);
  }
}
