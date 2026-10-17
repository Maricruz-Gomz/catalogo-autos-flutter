import 'package:flutter/material.dart';
import '../../core/state/favoritos_notifier.dart';
import '../../data/models/auto.dart';
import '../widgets/feature_row.dart';
import '../widgets/info_badge.dart';
import '../widgets/network_image_with_loader.dart';
import '../widgets/price_tag.dart';
import '../widgets/section_title.dart';

class DetailScreen extends StatelessWidget {
  final Auto auto;

  const DetailScreen({super.key, required this.auto});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${auto.marca} ${auto.modelo}'),
        actions: [
          ValueListenableBuilder<Set<int>>(
            valueListenable: FavoritosNotifier.instance,
            builder: (context, favoritos, child) {
              final esFavorito = favoritos.contains(auto.id);
              return IconButton(
                icon: Icon(esFavorito ? Icons.favorite : Icons.favorite_border),
                onPressed: () => FavoritosNotifier.instance.alternar(auto.id),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            NetworkImageWithLoader(
              url: auto.imagen,
              height: 240,
              width: double.infinity,
              borderRadius: BorderRadius.zero,
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: [
                      InfoBadge(texto: auto.categoria, icono: Icons.category),
                      InfoBadge(
                          texto: '${auto.anio}', icono: Icons.calendar_today),
                    ],
                  ),
                  const SizedBox(height: 12),
                  PriceTag(precio: auto.precio),
                  const SectionTitle(texto: 'Descripción'),
                  Text(auto.descripcion),
                  const SectionTitle(texto: 'Características'),
                  ...auto.caracteristicas.map((c) => FeatureRow(texto: c)),
                  const SizedBox(height: 16),
                  OutlinedButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('Volver'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}