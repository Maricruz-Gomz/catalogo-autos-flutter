import 'package:flutter/foundation.dart';

class FavoritosNotifier extends ValueNotifier<Set<int>> {
  FavoritosNotifier._() : super(<int>{});

  static final FavoritosNotifier instance = FavoritosNotifier._();

  void alternar(int id) {
    final nuevo = Set<int>.from(value);
    if (!nuevo.remove(id)) nuevo.add(id);
    value = nuevo;
  }
}