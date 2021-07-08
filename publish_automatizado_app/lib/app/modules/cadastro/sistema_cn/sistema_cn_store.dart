import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:publish_automatizado_app/app/model/message_model.dart';

import 'package:publish_automatizado_app/app/model/sistema_cn_model.dart';
import 'package:publish_automatizado_app/app/repositories/sistema_cn_repository.dart';
import 'package:publish_automatizado_app/app/store/sistema_cn_model_store.dart';
import 'package:publish_automatizado_app/app/utils/constants.dart';

part 'sistema_cn_store.g.dart';

class SistemaCNStore = _SistemaCNStoreBase with _$SistemaCNStore;

abstract class _SistemaCNStoreBase with Store {
  @observable
  ObservableList<SistemaCNModelStore>? sistemaCNs;

  final SistemaCNRepository _sistemaCNRepository;

  TextEditingController? nomeController, caminhoController;

  @observable
  SistemaCNModelStore sistemaCNModelStore;

  @observable
  bool _loading = true;

  _SistemaCNStoreBase(this._sistemaCNRepository, this.sistemaCNModelStore) {
    nomeController = TextEditingController();
    caminhoController = TextEditingController();

    sistemaCNs = ObservableList<SistemaCNModelStore>();

    fetchSistemaCNs();
  }

  @action
  selecionarSistemaCN(SistemaCNModelStore value) {
    sistemaCNModelStore.model = sistemaCNModelStore.model.copyWith(
      idCodigo: value.model.idCodigo,
      nomeSistema: value.model.nomeSistema,
      caminhoSistemaCN: value.model.caminhoSistemaCN,
    );

    nomeController!.text = sistemaCNModelStore.model.nomeSistema!;
    caminhoController!.text = sistemaCNModelStore.model.caminhoSistemaCN!;
  }

  fetchSistemaCNs() async {
    try {
      sistemaCNs = ObservableList<SistemaCNModelStore>();

      List<SistemaCNModel> modelos = await _sistemaCNRepository.fetchAll();

      if (modelos.length > 0) {
        modelos.forEach((e) {
          sistemaCNs!.add(SistemaCNModelStore(e));
        });
      }

      _loading = false;
    } catch (e) {
      _loading = false;
    }
  }

  home() => Modular.to.pushReplacementNamed(kPHome);

  @action
  Future<MessageModel> save() async {
    MessageModel messageModel;

    SistemaCNModel model = sistemaCNModelStore.model;

    if (model.idCodigo == 0) {
      messageModel = await _sistemaCNRepository.insert(model);
    } else {
      messageModel = await _sistemaCNRepository.update(model);
    }

    return messageModel;
  }

  @computed
  bool get loading => _loading;
}
