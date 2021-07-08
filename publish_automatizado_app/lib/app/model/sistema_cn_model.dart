import 'dart:convert';

class SistemaCNModel {
  int? idCodigo;
  String? nomeSistema;
  String? caminhoSistemaCN;
  SistemaCNModel({
    this.idCodigo,
    this.nomeSistema,
    this.caminhoSistemaCN,
  }) {
    idCodigo = idCodigo ?? 0;
  }

  SistemaCNModel copyWith({
    int? idCodigo,
    String? nomeSistema,
    String? caminhoSistemaCN,
  }) {
    return SistemaCNModel(
      idCodigo: idCodigo ?? this.idCodigo,
      nomeSistema: nomeSistema ?? this.nomeSistema,
      caminhoSistemaCN: caminhoSistemaCN ?? this.caminhoSistemaCN,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id_codigo': idCodigo,
      'nome_sistema': nomeSistema,
      'caminho_sistema_cn': caminhoSistemaCN,
    };
  }

  factory SistemaCNModel.fromMap(Map<String, dynamic> map) {
    return SistemaCNModel(
      idCodigo: map['id_codigo'],
      nomeSistema: map['nome_sistema'],
      caminhoSistemaCN: map['caminho_sistema_cn'],
    );
  }

  String toJson() => json.encode(toMap());

  factory SistemaCNModel.fromJson(String source) =>
      SistemaCNModel.fromMap(json.decode(source));
}
