import 'package:flutter/material.dart';
import 'package:recipe_finder_flutter/shared/constants/app_colors.dart';

class AppChipWidget extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const AppChipWidget({
    super.key,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(right: 8),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        alignment: Alignment.center, // Ensures text stays centered
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primaryColor : Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            // Fade the border when selected for a cleaner look
            color: isSelected ? AppColors.primaryColor : Colors.black12, 
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            // If background is primary, make text white. Otherwise, make it dark.
            color: isSelected ? Colors.white : Colors.black87,
          ),
        ),
      ),
    );
  }
}