class Auto {
  final int id;
  final String marca;
  final String modelo;
  final int anio;
  final String categoria;
  final double precio;
  final String descripcion;
  final String imagen;
  final List<String> caracteristicas;

  const Auto({
    required this.id,
    required this.marca,
    required this.modelo,
    required this.anio,
    required this.categoria,
    required this.precio,
    required this.descripcion,
    required this.imagen,
    required this.caracteristicas,
  });

  factory Auto.fromJson(Map<String, dynamic> json) {
    return Auto(
      id: json['id'] as int,
      marca: json['marca'] as String,
      modelo: json['modelo'] as String,
      anio: json['anio'] as int,
      categoria: json['categoria'] as String,
      precio: (json['precio'] as num).toDouble(),
      descripcion: json['descripcion'] as String,
      imagen: json['imagen'] as String,
      caracteristicas: List<String>.from(json['caracteristicas'] as List),
    );
  }
}