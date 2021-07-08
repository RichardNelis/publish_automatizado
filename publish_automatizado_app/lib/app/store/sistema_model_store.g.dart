// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sistema_model_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SistemaModelStore on _SistemaModelStoreBase, Store {
  Computed<dynamic>? _$isCheckedComputed;

  @override
  dynamic get isChecked =>
      (_$isCheckedComputed ??= Computed<dynamic>(() => super.isChecked,
              name: '_SistemaModelStoreBase.isChecked'))
          .value;

  final _$modelAtom = Atom(name: '_SistemaModelStoreBase.model');

  @override
  SistemaModel get model {
    _$modelAtom.reportRead();
    return super.model;
  }

  @override
  set model(SistemaModel value) {
    _$modelAtom.reportWrite(value, super.model, () {
      super.model = value;
    });
  }

  final _$_checkedAtom = Atom(name: '_SistemaModelStoreBase._checked');

  @override
  bool get _checked {
    _$_checkedAtom.reportRead();
    return super._checked;
  }

  @override
  set _checked(bool value) {
    _$_checkedAtom.reportWrite(value, super._checked, () {
      super._checked = value;
    });
  }

  final _$_SistemaModelStoreBaseActionController =
      ActionController(name: '_SistemaModelStoreBase');

  @override
  dynamic changeCheckBox(bool? value) {
    final _$actionInfo = _$_SistemaModelStoreBaseActionController.startAction(
        name: '_SistemaModelStoreBase.changeCheckBox');
    try {
      return super.changeCheckBox(value);
    } finally {
      _$_SistemaModelStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeNomeSistema(dynamic value) {
    final _$actionInfo = _$_SistemaModelStoreBaseActionController.startAction(
        name: '_SistemaModelStoreBase.changeNomeSistema');
    try {
      return super.changeNomeSistema(value);
    } finally {
      _$_SistemaModelStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeCaminhoSistema(dynamic value) {
    final _$actionInfo = _$_SistemaModelStoreBaseActionController.startAction(
        name: '_SistemaModelStoreBase.changeCaminhoSistema');
    try {
      return super.changeCaminhoSistema(value);
    } finally {
      _$_SistemaModelStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
model: ${model},
isChecked: ${isChecked}
    ''';
  }
}
