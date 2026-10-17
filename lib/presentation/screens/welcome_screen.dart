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
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFDCEBE5), // verde suave
              Color(0xFFE6EDF2), // azul muy claro
              AppColors.background,
            ],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Spacer(),
                Center(
                  child: Container(
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.primary.withValues(alpha: 0.25),
                          blurRadius: 30,
                          offset: const Offset(0, 12),
                        ),
                      ],
                    ),
                    child: const Icon(
                      Icons.directions_car_filled,
                      size: 80,
                      color: AppColors.primary,
                    ),
                  ),
                ),
                const SizedBox(height: 32),
                const Text(
                  'Bienvenid@ a tu catálogo de autos',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w800,
                    color: AppColors.textDark,
                    height: 1.2,
                  ),
                ),
                const SizedBox(height: 12),
                const Text(
                  'Encuentra tu auto ideal en segundos.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15,
                    color: AppColors.textLight,
                    height: 1.4,
                  ),
                ),
                const SizedBox(height: 24),
                const Wrap(
                  alignment: WrapAlignment.center,
                  spacing: 8,
                  runSpacing: 8,
                  children: [
                    _Etiqueta(icono: Icons.directions_car, texto: 'Sedán'),
                    _Etiqueta(icono: Icons.terrain, texto: 'SUV'),
                    _Etiqueta(icono: Icons.speed, texto: 'Deportivo'),
                    _Etiqueta(icono: Icons.local_shipping, texto: 'Pickup'),
                  ],
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
      ),
    );
  }
}

class _Etiqueta extends StatelessWidget {
  final IconData icono;
  final String texto;

  const _Etiqueta({required this.icono, required this.texto});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.accent),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icono, size: 16, color: AppColors.primary),
          const SizedBox(width: 6),
          Text(
            texto,
            style: const TextStyle(fontSize: 12, color: AppColors.textDark),
          ),
        ],
      ),
    );
  }
}