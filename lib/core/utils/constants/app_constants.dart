import 'package:digital_defender/core/utils/constants/string_constants.dart';
import 'package:digital_defender/di/di_container.dart';
import 'package:digital_defender/features/walkthrough/presentation/widgets/walthrough_item.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

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

/// The environment class
/// used to change the project environment
class Environment {
  final String name;

  const Environment(this.name);

  static const dev = 'dev';
  static const prod = 'prod';
}

/// get logger singleton from the app container
Logger get logger => getIt<Logger>();
