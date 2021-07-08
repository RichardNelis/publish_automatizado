// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chamado_model_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ChamadoModelStore on _ChamadoModelStoreBase, Store {
  final _$modelAtom = Atom(name: '_ChamadoModelStoreBase.model');

  @override
  ChamadoModel get model {
    _$modelAtom.reportRead();
    return super.model;
  }

  @override
  set model(ChamadoModel value) {
    _$modelAtom.reportWrite(value, super.model, () {
      super.model = value;
    });
  }

  final _$_ChamadoModelStoreBaseActionController =
      ActionController(name: '_ChamadoModelStoreBase');

  @override
  dynamic changeNumeroChamado(dynamic value) {
    final _$actionInfo = _$_ChamadoModelStoreBaseActionController.startAction(
        name: '_ChamadoModelStoreBase.changeNumeroChamado');
    try {
      return super.changeNumeroChamado(value);
    } finally {
      _$_ChamadoModelStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeResponsavel(dynamic value) {
    final _$actionInfo = _$_ChamadoModelStoreBaseActionController.startAction(
        name: '_ChamadoModelStoreBase.changeResponsavel');
    try {
      return super.changeResponsavel(value);
    } finally {
      _$_ChamadoModelStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeMunicipio(dynamic value) {
    final _$actionInfo = _$_ChamadoModelStoreBaseActionController.startAction(
        name: '_ChamadoModelStoreBase.changeMunicipio');
    try {
      return super.changeMunicipio(value);
    } finally {
      _$_ChamadoModelStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
model: ${model}
    ''';
  }
}
