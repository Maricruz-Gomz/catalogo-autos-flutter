import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';

class InfoBadge extends StatelessWidget {
  final String texto;
  final IconData icono;

  const InfoBadge({super.key, required this.texto, required this.icono});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: AppColors.accent.withValues(alpha: 0.25),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icono, size: 14, color: AppColors.primary),
          const SizedBox(width: 6),
          Text(texto,
              style: const TextStyle(fontSize: 12, color: AppColors.textDark)),
        ],
      ),
    );
  }
}