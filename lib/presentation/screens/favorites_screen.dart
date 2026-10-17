import 'package:flutter/material.dart';
import '../../core/state/favoritos_notifier.dart';
import '../../data/models/auto.dart';
import '../../data/repositories/auto_repository.dart';
import '../widgets/auto_card.dart';
import '../widgets/empty_state_view.dart';
import 'detail_screen.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  final AutoRepository _repositorio = AutoRepository();
  late final Future<List<Auto>> _autos = _repositorio.obtenerAutos();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Favoritos')),
      body: FutureBuilder<List<Auto>>(
        future: _autos,
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return const Center(child: CircularProgressIndicator());
          }
          final todos = snapshot.data ?? [];
          return ValueListenableBuilder<Set<int>>(
            valueListenable: FavoritosNotifier.instance,
            builder: (context, favoritos, child) {
              final lista =
                  todos.where((a) => favoritos.contains(a.id)).toList();
              if (lista.isEmpty) {
                return const EmptyStateView(
                  mensaje: 'Aún no tienes autos favoritos',
                  icono: Icons.favorite_border,
                );
              }
              return ListView.separated(
                padding: const EdgeInsets.all(16),
                itemCount: lista.length,
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 12),
                itemBuilder: (context, i) => AutoCard(
                  auto: lista[i],
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailScreen(auto: lista[i]),
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}