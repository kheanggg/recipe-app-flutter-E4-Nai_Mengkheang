import 'package:flutter/material.dart';
import 'package:recipe_finder_flutter/features/onboarding/data/onboarding_section_data.dart';
import 'package:recipe_finder_flutter/features/onboarding/utils/onboarding_util.dart';
import 'package:recipe_finder_flutter/main_screen.dart';
import 'widgets/onboarding_button_widget.dart';
import 'widgets/onboarding_indicator_widget.dart';
import 'widgets/onboarding_section_widget.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late final PageController _pageController;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final sections = OnboardingSectionData.getMainOnboardingSections();
    final int lastPage = sections.length - 1;

    String leftButtonText = '';
    String rightButtonText = '';
    if (_currentPage == 0) {
      leftButtonText = '';
      rightButtonText = 'Next';
    } else if (_currentPage == lastPage) {
      leftButtonText = 'Back';
      rightButtonText = 'Start';
    } else {
      leftButtonText = 'Back';
      rightButtonText = 'Next';
    }

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: sections.length,
                onPageChanged: (index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: OnboardingSectionWidget(
                      onboardingSection: sections[index],
                    ),
                  );
                },
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(bottom: 16.0, left: 16, right: 16, top: 8),
              child: Column(
                children: [
                  const SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: leftButtonText.isNotEmpty
                              ? OnboardingButtonWidget(
                            text: leftButtonText,
                            onPressed: () {
                              if (_currentPage > 0) {
                                _pageController.previousPage(
                                    duration: const Duration(milliseconds: 300),
                                    curve: Curves.ease);
                              }
                            },
                            backgroundColor: Colors.white,
                            textColor: Colors.black54,
                          )
                              : const SizedBox.shrink(),
                        ),
                      ),

                      Center(
                        child: OnboardingIndicatorWidget(
                          pageSize: sections.length,
                          currentPage: _currentPage
                        ),
                      ),

                      Expanded(
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: OnboardingButtonWidget(
                            text: rightButtonText,
                              onPressed: () async {
                                if (_currentPage < lastPage) {
                                  _pageController.nextPage(
                                      duration: const Duration(milliseconds: 300),
                                      curve: Curves.ease);
                                } else {
                                  // await setting onboarding completed, then navigate to login
                                  await OnboardingUtil.setOnboardingCompleted();

                                  Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                      builder: (context) => const MainScreen(),
                                    ),
                                  );
                                }
                              }
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}