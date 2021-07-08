// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeStore on HomeStoreBase, Store {
  Computed<bool>? _$habilitarBotaoComputed;

  @override
  bool get habilitarBotao =>
      (_$habilitarBotaoComputed ??= Computed<bool>(() => super.habilitarBotao,
              name: 'HomeStoreBase.habilitarBotao'))
          .value;

  final _$sistemasAtom = Atom(name: 'HomeStoreBase.sistemas');

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

  final _$gerarPublishAsyncAction = AsyncAction('HomeStoreBase.gerarPublish');

  @override
  Future<MessageModel> gerarPublish() {
    return _$gerarPublishAsyncAction.run(() => super.gerarPublish());
  }

  final _$excluirSistemaAsyncAction =
      AsyncAction('HomeStoreBase.excluirSistema');

  @override
  Future<MessageModel> excluirSistema(int idSistema) {
    return _$excluirSistemaAsyncAction
        .run(() => super.excluirSistema(idSistema));
  }

  @override
  String toString() {
    return '''
sistemas: ${sistemas},
habilitarBotao: ${habilitarBotao}
    ''';
  }
}
