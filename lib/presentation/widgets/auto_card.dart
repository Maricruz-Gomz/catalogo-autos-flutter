import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../data/models/auto.dart';
import 'network_image_with_loader.dart';
import 'price_tag.dart';

class AutoCard extends StatelessWidget {
  final Auto auto;
  final VoidCallback onTap;

  const AutoCard({super.key, required this.auto, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.surface,
      elevation: 0,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: InkWell(
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            NetworkImageWithLoader(
              url: auto.imagen,
              height: 160,
              width: double.infinity,
              borderRadius: BorderRadius.zero,
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${auto.marca} ${auto.modelo}',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: AppColors.textDark,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '${auto.categoria} · ${auto.anio}',
                    style: const TextStyle(color: AppColors.textLight),
                  ),
                  const SizedBox(height: 8),
                  PriceTag(precio: auto.precio),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}