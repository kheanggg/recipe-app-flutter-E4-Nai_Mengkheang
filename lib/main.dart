import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:recipe_finder_flutter/features/onboarding/ui/onboarding_screen.dart';
import 'package:recipe_finder_flutter/features/onboarding/utils/onboarding_util.dart';
import 'package:recipe_finder_flutter/shared/constants/app_colors.dart';
import 'package:recipe_finder_flutter/shared/domain/model/meal.dart';
import 'package:recipe_finder_flutter/features/meal/ui/meal_screen.dart';
import 'package:recipe_finder_flutter/routes/app_routes.dart';
import 'main_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(fileName: ".env");

  final bool onboardingCompleted =
      await OnboardingUtil.isOnboardingCompleted();

  runApp(
    ProviderScope(
      child: MyApp(isOnboardingCompleted: onboardingCompleted),
    ),
  );
}


class MyApp extends ConsumerWidget {
  final bool isOnboardingCompleted;

  const MyApp({
    super.key,
    required this.isOnboardingCompleted,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Recipe Finder App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.primaryColor,
        ),
      ),

      // 👇 Decide FIRST screen here
      home: isOnboardingCompleted
          ? const MainScreen()
          : const OnboardingScreen(),

      // Keep routes for navigation later
      onGenerateRoute: (settings) {
        if (settings.name == AppRoutes.mealDetail) {
          final meal = settings.arguments as Meal;
          return MaterialPageRoute(
            builder: (context) => MealDetailScreen(meal: meal),
          );
        }
        return null;
      },
    );
  }
}
