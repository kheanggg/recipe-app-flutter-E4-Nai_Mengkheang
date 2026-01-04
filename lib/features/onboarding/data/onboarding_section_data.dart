import 'package:recipe_finder_flutter/features/onboarding/domain/model/onboarding_section.dart';

class OnboardingSectionData {

  static List<OnboardingSection> getMainOnboardingSections() {
    return const [
      // =============================================================================
      // SECTION 1: Discover Delicious Recipes
      // =============================================================================
      OnboardingSection(
        title: "Discover Delicious Recipes",
        subtitle: "Explore Popular Cuisines",
        description:
            "Get the latest breaking news, trending stories, and real-time updates from trusted sources around the world. Never miss what matters most to you.",
        imagePath: 'assets/images/onboarding_section1.jpg',
      ),

      // =============================================================================
      // SECTION 2: Ingredients Made Simple
      // =============================================================================
      OnboardingSection(
        title: "Ingredients Made Simple",
        subtitle: "Search by What You Have",
        description:
            "Have ingredients at home? Just enter them and discover recipes you can make right now. Cooking becomes easier and smarter.",
        imagePath: 'assets/images/onboarding_section2.jpg',
      ),

      // =============================================================================
      // SECTION 3: Save & Learn
      // =============================================================================
      OnboardingSection(
        title: "Save & Learn",
        subtitle: "Favorite & Step-by-Step Tutorials",
        description:
            "Save your favorite meals for later and follow easy, step-by-step guides to cook like a pro anytime.",
        imagePath: 'assets/images/onboarding_section3.jpg',
      ),
    ];
  }
}
