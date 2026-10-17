import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';

class FeatureRow extends StatelessWidget {
  final String texto;

  const FeatureRow({super.key, required this.texto});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          const Icon(Icons.check_circle_outline,
              size: 18, color: AppColors.accent),
          const SizedBox(width: 8),
          Expanded(
            child: Text(texto,
                style: const TextStyle(
                    fontSize: 14, color: AppColors.textDark)),
          ),
        ],
      ),
    );
  }
}