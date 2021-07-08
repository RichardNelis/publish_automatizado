// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sistema_cn_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SistemaCNStore on _SistemaCNStoreBase, Store {
  Computed<bool>? _$loadingComputed;

  @override
  bool get loading => (_$loadingComputed ??= Computed<bool>(() => super.loading,
          name: '_SistemaCNStoreBase.loading'))
      .value;

  final _$sistemaCNsAtom = Atom(name: '_SistemaCNStoreBase.sistemaCNs');

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

  final _$sistemaCNModelStoreAtom =
      Atom(name: '_SistemaCNStoreBase.sistemaCNModelStore');

  @override
  SistemaCNModelStore get sistemaCNModelStore {
    _$sistemaCNModelStoreAtom.reportRead();
    return super.sistemaCNModelStore;
  }

  @override
  set sistemaCNModelStore(SistemaCNModelStore value) {
    _$sistemaCNModelStoreAtom.reportWrite(value, super.sistemaCNModelStore, () {
      super.sistemaCNModelStore = value;
    });
  }

  final _$_loadingAtom = Atom(name: '_SistemaCNStoreBase._loading');

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

  final _$saveAsyncAction = AsyncAction('_SistemaCNStoreBase.save');

  @override
  Future<MessageModel> save() {
    return _$saveAsyncAction.run(() => super.save());
  }

  final _$_SistemaCNStoreBaseActionController =
      ActionController(name: '_SistemaCNStoreBase');

  @override
  dynamic selecionarSistemaCN(SistemaCNModelStore value) {
    final _$actionInfo = _$_SistemaCNStoreBaseActionController.startAction(
        name: '_SistemaCNStoreBase.selecionarSistemaCN');
    try {
      return super.selecionarSistemaCN(value);
    } finally {
      _$_SistemaCNStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
sistemaCNs: ${sistemaCNs},
sistemaCNModelStore: ${sistemaCNModelStore},
loading: ${loading}
    ''';
  }
}
