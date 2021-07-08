import 'dart:convert';

import 'package:publish_automatizado/app/model/sistema_cn_model.dart';

class DependenciaModel {
  List<SistemaCNModel>? sistemaCns;
  DependenciaModel({
    this.sistemaCns,
  });

  DependenciaModel copyWith({
    List<SistemaCNModel>? sistemaCns,
  }) {
    return DependenciaModel(
      sistemaCns: sistemaCns ?? this.sistemaCns,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'sistema_cn': sistemaCns?.map((x) => x.toMap()).toList(),
    };
  }

  factory DependenciaModel.fromMap(Map<String, dynamic> map) {
    return DependenciaModel(
      sistemaCns: map['sistema_cn'] == null
          ? null
          : List<SistemaCNModel>.from(
              map['sistema_cn']?.map((x) => SistemaCNModel.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory DependenciaModel.fromJson(String source) =>
      DependenciaModel.fromMap(json.decode(source));
}
