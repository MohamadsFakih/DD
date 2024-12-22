import 'package:digital_defender/core/utils/constants/app_constants.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:saver_gallery/saver_gallery.dart';
import 'package:path_provider/path_provider.dart';
import 'package:url_launcher/url_launcher.dart';

Future<bool> requestMediaPermissions() async {
  // Check and request storage permission for Android or photo library permission for iOS
  PermissionStatus storagePermission;
  PermissionStatus photosPermission;

  // Check platform and request the appropriate permission
  if (await Permission.storage.isGranted || await Permission.photos.isGranted) {
    return true; // Permissions already granted
  }

  // Request permissions
  storagePermission = await Permission.storage.request(); // For Android
  photosPermission = await Permission.photos.request(); // For iOS

  // Check final permission status
  if (storagePermission.isGranted || photosPermission.isGranted) {
    return true; // Permissions granted
  } else {
    return false; // Permissions denied
  }
}

Future<void> saveVideo(String link) async {
  final bool hasPermission = await requestMediaPermissions();

  if (!hasPermission) {
    print("Permission denied");
    return;
  }

  try {
    // Get a temporary directory for downloading the video
    var tempDir = await getTemporaryDirectory();
    String videoPath = "${tempDir.path}/sample_video.mp4";

    print("Downloading video...");
    await Dio().download(
      link,
      videoPath,
      onReceiveProgress: (received, total) {
        if (total != -1) {
          print("Progress: ${(received / total * 100).toStringAsFixed(0)}%");
        }
      },
    );

    print("Saving video to gallery...");
    final result = await SaverGallery.saveFile(
      filePath: videoPath,
      skipIfExists: true,
      fileName: extractFilename(link),
      androidRelativePath: "Movies",
    );

    if (result.isSuccess) {
      print("Video saved to gallery successfully!");
    } else {
      print("Failed to save video.");
    }
  } catch (e) {
    print("Error: $e");
  }
}

String extractFilename(String url) {
  final uri = Uri.parse(url);
  logger.d(uri.pathSegments.last);
  return uri.pathSegments.last; // Extracts the last segment of the path
}

String getCorrectSocialMediaName(int index) {
  switch (index) {
    case 0:
      return "Facebook";
    case 1:
      return "Instagram";
    case 2:
      return "Tiktok";
    case 3:
      return "Twitter";
    default:
      return "Facebook";
  }
}

Future<void> openUrl(String url) async {
  final Uri uri = Uri.parse(url);
  if (await canLaunchUrl(uri)) {
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  } else {
    throw 'Could not launch $url';
  }
}

void showTopSnackbar({
  required String title,
  required String message,
  Color? backgroundColor,
  Color? colorText,
}) {
  if (!Get.isSnackbarOpen) {
    Get.snackbar(
      title,
      message,
      backgroundColor: backgroundColor ?? const Color(0xffA7D394),
      colorText: colorText ?? const Color(0xFF303333),
      snackPosition: SnackPosition.TOP,
      margin: const EdgeInsets.all(16),
      borderRadius: 12,
    );
  }
}
