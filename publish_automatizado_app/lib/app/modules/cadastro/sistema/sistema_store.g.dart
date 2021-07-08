// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sistema_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SistemaStore on _SistemaStoreBase, Store {
  Computed<bool>? _$loadingComputed;

  @override
  bool get loading => (_$loadingComputed ??= Computed<bool>(() => super.loading,
          name: '_SistemaStoreBase.loading'))
      .value;

  final _$sistemasAtom = Atom(name: '_SistemaStoreBase.sistemas');

  @override
  ObservableList<SistemaModelStore>? get sistemas {
    _$sistemasAtom.reportRead();
    return super.sistemas;
  }

  @override
  set sistemas(ObservableList<SistemaModelStore>? value) {
    _$sistemasAtom.reportWrite(value, super.sistemas, () {
      super.sistemas = value;
    });
  }

  final _$sistemaCNsAtom = Atom(name: '_SistemaStoreBase.sistemaCNs');

  @override
  ObservableList<SistemaCNModelStore>? get sistemaCNs {
    _$sistemaCNsAtom.reportRead();
    return super.sistemaCNs;
  }

  @override
  set sistemaCNs(ObservableList<SistemaCNModelStore>? value) {
    _$sistemaCNsAtom.reportWrite(value, super.sistemaCNs, () {
      super.sistemaCNs = value;
    });
  }

  final _$dependenciasAtom = Atom(name: '_SistemaStoreBase.dependencias');

  @override
  ObservableList<SistemaCNModelStore>? get dependencias {
    _$dependenciasAtom.reportRead();
    return super.dependencias;
  }

  @override
  set dependencias(ObservableList<SistemaCNModelStore>? value) {
    _$dependenciasAtom.reportWrite(value, super.dependencias, () {
      super.dependencias = value;
    });
  }

  final _$sistemaModelStoreAtom =
      Atom(name: '_SistemaStoreBase.sistemaModelStore');

  @override
  SistemaModelStore get sistemaModelStore {
    _$sistemaModelStoreAtom.reportRead();
    return super.sistemaModelStore;
  }

  @override
  set sistemaModelStore(SistemaModelStore value) {
    _$sistemaModelStoreAtom.reportWrite(value, super.sistemaModelStore, () {
      super.sistemaModelStore = value;
    });
  }

  final _$_loadingAtom = Atom(name: '_SistemaStoreBase._loading');

  @override
  bool get _loading {
    _$_loadingAtom.reportRead();
    return super._loading;
  }

  @override
  set _loading(bool value) {
    _$_loadingAtom.reportWrite(value, super._loading, () {
      super._loading = value;
    });
  }

  final _$saveAsyncAction = AsyncAction('_SistemaStoreBase.save');

  @override
  Future<MessageModel> save() {
    return _$saveAsyncAction.run(() => super.save());
  }

  final _$_SistemaStoreBaseActionController =
      ActionController(name: '_SistemaStoreBase');

  @override
  dynamic selecionarSistema(SistemaModelStore value) {
    final _$actionInfo = _$_SistemaStoreBaseActionController.startAction(
        name: '_SistemaStoreBase.selecionarSistema');
    try {
      return super.selecionarSistema(value);
    } finally {
      _$_SistemaStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic addItemSistema(int index) {
    final _$actionInfo = _$_SistemaStoreBaseActionController.startAction(
        name: '_SistemaStoreBase.addItemSistema');
    try {
      return super.addItemSistema(index);
    } finally {
      _$_SistemaStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic addItemDependencia(int index) {
    final _$actionInfo = _$_SistemaStoreBaseActionController.startAction(
        name: '_SistemaStoreBase.addItemDependencia');
    try {
      return super.addItemDependencia(index);
    } finally {
      _$_SistemaStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeIndexDependencia(dynamic oldIndex, dynamic newIndex) {
    final _$actionInfo = _$_SistemaStoreBaseActionController.startAction(
        name: '_SistemaStoreBase.changeIndexDependencia');
    try {
      return super.changeIndexDependencia(oldIndex, newIndex);
    } finally {
      _$_SistemaStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
sistemas: ${sistemas},
sistemaCNs: ${sistemaCNs},
dependencias: ${dependencias},
sistemaModelStore: ${sistemaModelStore},
loading: ${loading}
    ''';
  }
}
