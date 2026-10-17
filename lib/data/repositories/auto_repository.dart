import '../datasources/auto_local_datasource.dart';
import '../models/auto.dart';

class AutoRepository {
  final AutoLocalDatasource _datasource;

  AutoRepository({AutoLocalDatasource? datasource})
      : _datasource = datasource ?? AutoLocalDatasource();

  Future<List<Auto>> obtenerAutos() => _datasource.cargarAutos();

  Future<List<Auto>> obtenerPorCategoria(String categoria) async {
    final autos = await _datasource.cargarAutos();
    return autos.where((a) => a.categoria == categoria).toList();
  }
}