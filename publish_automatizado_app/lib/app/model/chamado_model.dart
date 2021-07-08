import 'dart:convert';

class ChamadoModel {
  List<int>? esSistemas;
  String? numeroChamado;
  String? responsavel;
  String? municipio;
  ChamadoModel(
      {this.esSistemas, this.numeroChamado, this.responsavel, this.municipio});

  ChamadoModel copyWith({
    List<int>? esSistemas,
    String? numeroChamado,
    String? responsavel,
    String? municipio,
  }) {
    return ChamadoModel(
      esSistemas: esSistemas ?? this.esSistemas,
      numeroChamado: numeroChamado ?? this.numeroChamado,
      responsavel: responsavel ?? this.responsavel,
      municipio: municipio ?? this.municipio,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'es_sistemas': esSistemas,
      'numero_chamado': numeroChamado,
      'responsavel': responsavel,
      'municipio': municipio,
    };
  }

  factory ChamadoModel.fromMap(Map<String, dynamic> map) {
    return ChamadoModel(
      esSistemas: List<int>.from(map['es_sistemas']),
      numeroChamado: map['numero_chamado'],
      responsavel: map['responsavel'],
      municipio: map['municipio'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ChamadoModel.fromJson(String source) =>
      ChamadoModel.fromMap(json.decode(source));
}
