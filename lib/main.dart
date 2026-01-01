import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:recipe_finder_flutter/shared/constants/app_colors.dart';
import 'package:recipe_finder_flutter/shared/domain/model/meal.dart';
import 'package:recipe_finder_flutter/features/meal/ui/meal_screen.dart';
import 'package:recipe_finder_flutter/routes/app_routes.dart';
import 'main_screen.dart';

Future<void> main() async {
  // Ensure Flutter is initialized
  WidgetsFlutterBinding.ensureInitialized();

  // Load .env file
  await dotenv.load(fileName: ".env");

  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Recipe Finder App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryColor),
      ),
      // --- ROUTING START ---
      initialRoute: '/', 
      onGenerateRoute: (settings) {
        if (settings.name == '/') {
          return MaterialPageRoute(builder: (context) => const MainScreen());
        }
        
        if (settings.name == AppRoutes.mealDetail) {
          // Extract the meal object passed via arguments
          final meal = settings.arguments as Meal; 
          return MaterialPageRoute(
            builder: (context) => MealDetailScreen(meal: meal),
          );
        }

        return null; // Fallback to home if route not found
      },
      // --- ROUTING END ---
    );
  }
}