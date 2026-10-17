import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import '../models/auto.dart';

class AutoLocalDatasource {
  Future<List<Auto>> cargarAutos() async {
    final texto = await rootBundle.loadString('assets/data/autos.json');
    final List<dynamic> lista = jsonDecode(texto) as List<dynamic>;
    return lista
        .map((e) => Auto.fromJson(e as Map<String, dynamic>))
        .toList();
  }
}