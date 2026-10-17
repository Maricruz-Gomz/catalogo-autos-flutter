import 'package:flutter/material.dart';
import '../../data/models/auto.dart';
import '../../data/repositories/auto_repository.dart';
import '../widgets/auto_card.dart';
import 'detail_screen.dart';
import 'search_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final AutoRepository _repositorio = AutoRepository();
  late final Future<List<Auto>> _autos = _repositorio.obtenerAutos();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Catálogo de Autos'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SearchScreen()),
            ),
          ),
        ],
      ),
      body: FutureBuilder<List<Auto>>(
        future: _autos,
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return const Center(
              child: Text('No se pudieron cargar los autos'),
            );
          }
          final autos = snapshot.data ?? [];
          return ListView.separated(
            padding: const EdgeInsets.all(16),
            itemCount: autos.length,
            separatorBuilder: (context, index) => const SizedBox(height: 12),
            itemBuilder: (context, i) => AutoCard(
              auto: autos[i],
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailScreen(auto: autos[i]),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}