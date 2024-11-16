import 'package:digital_defender/core/utils/constants/app_constants.dart';
import 'package:digital_defender/features/login/presentation/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class WalkthroughScreen extends StatefulWidget {
  const WalkthroughScreen({super.key});

  @override
  State<WalkthroughScreen> createState() => _WalkthroughScreenState();
}

class _WalkthroughScreenState extends State<WalkthroughScreen> {
  final PageController _controller = PageController(initialPage: 0);
  final ValueNotifier<int> _currentIndex = ValueNotifier(0);
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.onSurface,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(),
          ValueListenableBuilder(
              valueListenable: _currentIndex,
              builder: (context, val, _) {
                return SizedBox(
                  height: 200,
                  child: PageView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      controller: _controller,
                      itemCount: walkthroughItems.length,
                      itemBuilder: (context, index) {
                        return walkthroughItems[index];
                      }),
                );
              }),
          const Spacer(),
          ValueListenableBuilder(
              valueListenable: _currentIndex,
              builder: (context, val, _) {
                return SmoothPageIndicator(
                  controller: _controller,
                  count: walkthroughItems.length,
                  effect: WormEffect(
                      activeDotColor: colorScheme.primary,
                      dotHeight: 12,
                      dotWidth: 12),
                  onDotClicked: (index) {},
                );
              }),
          const SizedBox(
            height: 32,
          ),
          SizedBox(
            width: 200,
            child: ElevatedButton(
              onPressed: () {
                if (_currentIndex.value != 3) {
                  _currentIndex.value++;
                  _controller.animateToPage(
                    _currentIndex.value,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeIn,
                  );
                } else {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginScreen(),
                    ),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: colorScheme.primary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text(
                "Next",
                style: textTheme.labelLarge
                    ?.copyWith(color: colorScheme.onSurface),
              ),
            ),
          ),
          const SizedBox(
            height: 64,
          )
        ],
      ),
    );
  }
}
