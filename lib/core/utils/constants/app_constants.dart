import 'package:digital_defender/core/utils/constants/string_constants.dart';
import 'package:digital_defender/features/walkthrough/presentation/widgets/walthrough_item.dart';
import 'package:flutter/material.dart';

const List<WalkthroughItem> walkthroughItems = [
  WalkthroughItem(
    icon: Icons.remove_red_eye,
    title: walkthrough1Title,
    description: walkthrough1Desc,
  ),
  WalkthroughItem(
    icon: Icons.chat,
    title: walkthrough2Title,
    description: walkthrough2Desc,
  ),
  WalkthroughItem(
    icon: Icons.report,
    title: walkthrough3Title,
    description: walkthrough3Desc,
  ),
  WalkthroughItem(
    icon: Icons.change_circle,
    title: walkthrough4Title,
    description: walkthrough4Desc,
  ),
];
