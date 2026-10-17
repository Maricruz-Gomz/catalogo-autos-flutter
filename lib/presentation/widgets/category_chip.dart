import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';

class CategoryChip extends StatelessWidget {
  final String etiqueta;
  final bool seleccionada;
  final VoidCallback onTap;

  const CategoryChip({
    super.key,
    required this.etiqueta,
    required this.seleccionada,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ChoiceChip(
      label: Text(etiqueta),
      selected: seleccionada,
      onSelected: (_) => onTap(),
      selectedColor: AppColors.accent.withValues(alpha: 0.4),
      backgroundColor: AppColors.surface,
    );
  }
}