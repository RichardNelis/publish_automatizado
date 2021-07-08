import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:publish_automatizado/app/model/message_model.dart';
import 'package:publish_automatizado/app/model/sistema_model.dart';
import 'package:publish_automatizado/app/repositories/publish_repository.dart';
import 'package:publish_automatizado/app/repositories/sistema_repository.dart';
import 'package:publish_automatizado/app/store/chamado_model_store.dart';

import 'package:publish_automatizado/app/store/sistema_model_store.dart';
import 'package:publish_automatizado/app/utils/constants.dart';

part 'home_store.g.dart';

class HomeStore = HomeStoreBase with _$HomeStore;

abstract class HomeStoreBase with Store {
  @observable
  ObservableList<SistemaModelStore>? sistemas;

  final SistemaRepository _repository;
  final PublishRepository _publishRepository;

  ChamadoModelStore modelStore;

  HomeStoreBase(this.modelStore, this._repository, this._publishRepository) {
    fetchSistemas();
  }

  fetchSistemas() async {
    try {
      List<SistemaModel> modelos = await _repository.fetchAll();
      sistemas = null;

      if (modelos.length > 0) {
        sistemas = ObservableList<SistemaModelStore>();

        modelos.forEach((e) {
          sistemas!.add(SistemaModelStore(e));
        });
      }
    } catch (e) {
      sistemas = null;
    }
  }

  cadastroSistema() => Modular.to.pushNamed(kPSistema);

  cadastroSistemaCN() => Modular.to.pushNamed(kPSistemaCN);

  @computed
  bool get habilitarBotao => sistemas!.any((e) => e.isChecked);

  @action
  Future<MessageModel> gerarPublish() async {
    MessageModel messageModel;

    List<int> esSistemas = <int>[];

    sistemas!.forEach((element) {
      if (element.isChecked) {
        esSistemas.add(element.model.idCodigo!);
      }
    });

    modelStore.model.esSistemas = esSistemas;
    messageModel = await _publishRepository.publish(modelStore.model);

    return messageModel;
  }

  @action
  Future<MessageModel> excluirSistema(int idSistema) async {
    MessageModel messageModel;

    messageModel = await _repository.delete(idSistema);

    return messageModel;
  }
}
