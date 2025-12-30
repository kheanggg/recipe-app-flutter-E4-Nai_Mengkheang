import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipe_finder_flutter/features/home/ui/widgets/category_items_widget.dart';
import 'package:recipe_finder_flutter/shared/data/remote/category_service.dart';
import 'package:recipe_finder_flutter/shared/data/repository/category_repository.dart';
import 'package:recipe_finder_flutter/features/home/ui/notifiers/home_notifier.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Watch the provider we just created
    final categoriesAsync = ref.watch(homeCategoriesProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Home',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Categories',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ),
          // Use .when to handle the different UI states
          categoriesAsync.when(
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (err, stack) => Center(child: Text('Error: $err')),
            data: (categories) => CategoryItemsWidget(categories: categories),
          ),
        ],
      ),
    );
  }
}
