import 'package:flutter/material.dart';
import '../../data/models/auto.dart';
import '../../data/repositories/auto_repository.dart';
import '../widgets/auto_card.dart';
import '../widgets/category_chip.dart';
import '../widgets/empty_state_view.dart';
import '../widgets/search_bar_widget.dart';
import 'detail_screen.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final AutoRepository _repositorio = AutoRepository();
  late final Future<List<Auto>> _autos = _repositorio.obtenerAutos();
  String _texto = '';
  String _categoria = 'Todas';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Buscar')),
      body: FutureBuilder<List<Auto>>(
        future: _autos,
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return const EmptyStateView(
              mensaje: 'No se pudieron cargar los autos',
              icono: Icons.error_outline,
            );
          }
          final todos = snapshot.data ?? [];
          final categorias = ['Todas', ...{for (final a in todos) a.categoria}];
          final filtrados = todos.where((a) {
            final nombre = '${a.marca} ${a.modelo}'.toLowerCase();
            final coincideTexto = nombre.contains(_texto.toLowerCase());
            final coincideCategoria =
                _categoria == 'Todas' || a.categoria == _categoria;
            return coincideTexto && coincideCategoria;
          }).toList();

          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: SearchBarWidget(
                  onChanged: (valor) => setState(() => _texto = valor),
                ),
              ),
              SizedBox(
                height: 44,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  itemCount: categorias.length,
                  separatorBuilder: (context, index) => const SizedBox(width: 8),
                  itemBuilder: (context, i) => CategoryChip(
                    etiqueta: categorias[i],
                    seleccionada: categorias[i] == _categoria,
                    onTap: () => setState(() => _categoria = categorias[i]),
                  ),
                ),
              ),
              Expanded(
                child: filtrados.isEmpty
                    ? const EmptyStateView(mensaje: 'No hay autos con ese filtro')
                    : ListView.separated(
                        padding: const EdgeInsets.all(16),
                        itemCount: filtrados.length,
                        separatorBuilder: (context, index) =>
                            const SizedBox(height: 12),
                        itemBuilder: (context, i) => AutoCard(
                          auto: filtrados[i],
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  DetailScreen(auto: filtrados[i]),
                            ),
                          ),
                        ),
                      ),
              ),
            ],
          );
        },
      ),
    );
  }
}