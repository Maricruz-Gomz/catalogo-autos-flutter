
import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../widgets/app_primary_button.dart';

class WelcomeScreen extends StatelessWidget {
  final VoidCallback onEntrar;

  const WelcomeScreen({
    super.key,
    required this.onEntrar,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Spacer(),
              const Icon(
                Icons.directions_car,
                size: 96,
                color: AppColors.primary,
              ),
              const SizedBox(height: 24),
              const Text(
                'Catálogo de Autos',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w700,
                  color: AppColors.textDark,
                ),
              ),
              const SizedBox(height: 12),
              const Text(
                'Explora modelos, categorías y características de tus autos favoritos.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15,
                  color: AppColors.textLight,
                ),
              ),
              const Spacer(),
              AppPrimaryButton(
                texto: 'Entrar al catálogo',
                onPressed: onEntrar,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
