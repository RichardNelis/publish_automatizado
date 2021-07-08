// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sistema_cn_model_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SistemaCNModelStore on _SistemaCNModelStoreBase, Store {
  final _$modelAtom = Atom(name: '_SistemaCNModelStoreBase.model');

  @override
  SistemaCNModel get model {
    _$modelAtom.reportRead();
    return super.model;
  }

  @override
  set model(SistemaCNModel value) {
    _$modelAtom.reportWrite(value, super.model, () {
      super.model = value;
    });
  }

  final _$_SistemaCNModelStoreBaseActionController =
      ActionController(name: '_SistemaCNModelStoreBase');

  @override
  dynamic changeNomeSistema(dynamic value) {
    final _$actionInfo = _$_SistemaCNModelStoreBaseActionController.startAction(
        name: '_SistemaCNModelStoreBase.changeNomeSistema');
    try {
      return super.changeNomeSistema(value);
    } finally {
      _$_SistemaCNModelStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeCaminhoSistema(dynamic value) {
    final _$actionInfo = _$_SistemaCNModelStoreBaseActionController.startAction(
        name: '_SistemaCNModelStoreBase.changeCaminhoSistema');
    try {
      return super.changeCaminhoSistema(value);
    } finally {
      _$_SistemaCNModelStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
model: ${model}
    ''';
  }
}
