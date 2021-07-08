import 'dart:convert';

import 'package:publish_automatizado/app/model/sistema_cn_model.dart';

class SistemaCreateModel {
  int? idCodigo;
  String? nomeSistema;
  String? caminhoSistema;
  List<int>? dependencias;
  SistemaCreateModel({
    this.idCodigo,
    this.nomeSistema,
    this.caminhoSistema,
    this.dependencias,
  }) {
    idCodigo = idCodigo ?? 0;
    dependencias = [];
  }

  SistemaCreateModel copyWith({
    int? idCodigo,
    String? nomeSistema,
    String? caminhoSistema,
    List<int>? dependencias,
  }) {
    return SistemaCreateModel(
      idCodigo: idCodigo ?? this.idCodigo,
      nomeSistema: nomeSistema ?? this.nomeSistema,
      caminhoSistema: caminhoSistema ?? this.caminhoSistema,
      dependencias: dependencias ?? this.dependencias,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id_codigo': idCodigo,
      'nome_sistema': nomeSistema,
      'caminho_sistema': caminhoSistema,
      'dependencias': dependencias?.map((x) => x).toList(),
    };
  }

  factory SistemaCreateModel.fromMap(Map<String, dynamic> map) {
    return SistemaCreateModel(
      idCodigo: map['id_codigo'],
      nomeSistema: map['nome_sistema'],
      caminhoSistema: map['caminho_sistema'],
      dependencias: List<int>.from(
        map['dependencias']?.map(
          (x) => SistemaCNModel.fromMap(x),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory SistemaCreateModel.fromJson(String source) =>
      SistemaCreateModel.fromMap(json.decode(source));
}
