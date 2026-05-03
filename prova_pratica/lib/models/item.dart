class Item {
  final int? id;
  final String titulo;
  final String descricao;
  final String data;

  const Item({
    this.id,
    required this.titulo,
    required this.descricao,
    required this.data,
  });

  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
      id: map['id'] as int?,
      titulo: map['titulo'] as String,
      descricao: map['descricao'] as String,
      data: map['data'] as String,
    );
  }

  Map<String, dynamic> toMap() {
    final map = <String, dynamic>{
      'titulo': titulo,
      'descricao': descricao,
      'data': data,
    };
    if (id != null) map['id'] = id;
    return map;
  }
}
