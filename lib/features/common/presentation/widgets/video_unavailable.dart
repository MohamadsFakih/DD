import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class VideoUnavailable extends StatelessWidget {
  const VideoUnavailable({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.7),
          borderRadius: BorderRadius.circular(16),
        ),
        height: 400,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              AppLocalizations.of(context)!.videoUnavailable,
              style: textTheme.headlineSmall
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
            Padding(
              padding:
              const EdgeInsets.symmetric(vertical: 4.0, horizontal: 16),
              child: Text(
                AppLocalizations.of(context)!.videoDoesNotExist,
                textAlign: TextAlign.center,
                style: textTheme.titleMedium,
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              AppLocalizations.of(context)!.learMore,
              style: textTheme.labelLarge?.copyWith(
                  color: Colors.white, fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
