import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';

class EmptyStateView extends StatelessWidget {
  final String mensaje;
  final IconData icono;

  const EmptyStateView({
    super.key,
    required this.mensaje,
    this.icono = Icons.search_off,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icono, size: 56, color: AppColors.textLight),
            const SizedBox(height: 12),
            Text(mensaje,
                textAlign: TextAlign.center,
                style: const TextStyle(color: AppColors.textLight)),
          ],
        ),
      ),
    );
  }
}