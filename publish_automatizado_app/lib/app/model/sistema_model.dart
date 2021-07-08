import 'dart:convert';

import 'package:publish_automatizado/app/model/dependencia_model.dart';

class SistemaModel {
  int? idCodigo;
  String? nomeSistema;
  String? caminhoSistema;
  DependenciaModel? dependencia;
  SistemaModel({
    this.idCodigo,
    this.nomeSistema,
    this.caminhoSistema,
    this.dependencia,
  });

  SistemaModel copyWith({
    int? idCodigo,
    String? nomeSistema,
    String? caminhoSistema,
    DependenciaModel? dependencia,
  }) {
    return SistemaModel(
      idCodigo: idCodigo ?? this.idCodigo,
      nomeSistema: nomeSistema ?? this.nomeSistema,
      caminhoSistema: caminhoSistema ?? this.caminhoSistema,
      dependencia: dependencia ?? this.dependencia,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id_codigo': idCodigo,
      'nome_sistema': nomeSistema,
      'caminho_sistema': caminhoSistema,
      'dependencia': dependencia?.toMap(),
    };
  }

  factory SistemaModel.fromMap(Map<String, dynamic> map) {
    return SistemaModel(
      idCodigo: map['id_codigo'],
      nomeSistema: map['nome_sistema'],
      caminhoSistema: map['caminho_sistema'],
      dependencia: DependenciaModel.fromMap(map['dependencia']),
    );
  }

  String toJson() => json.encode(toMap());

  factory SistemaModel.fromJson(String source) =>
      SistemaModel.fromMap(json.decode(source));
}
