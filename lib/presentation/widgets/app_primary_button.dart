import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';

class AppPrimaryButton extends StatelessWidget {
  final String texto;
  final VoidCallback onPressed;
  final IconData? icono;

  const AppPrimaryButton({
    super.key,
    required this.texto,
    required this.onPressed,
    this.icono,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 48,
      child: ElevatedButton.icon(
        onPressed: onPressed,
        icon: Icon(icono ?? Icons.arrow_forward, size: 20),
        label: Text(texto),
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }
}