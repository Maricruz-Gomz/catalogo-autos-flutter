import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';

class PriceTag extends StatelessWidget {
  final double precio;

  const PriceTag({super.key, required this.precio});

  String _formatear(double valor) {
    final texto = valor.toStringAsFixed(0);
    final buffer = StringBuffer();
    for (var i = 0; i < texto.length; i++) {
      if (i > 0 && (texto.length - i) % 3 == 0) buffer.write(',');
      buffer.write(texto[i]);
    }
    return '\$${buffer.toString()}';
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      _formatear(precio),
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w700,
        color: AppColors.primary,
      ),
    );
  }
}