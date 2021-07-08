import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:publish_automatizado_app/app/model/message_model.dart';
import 'package:publish_automatizado_app/app/model/sistema_cn_model.dart';
import 'package:publish_automatizado_app/app/model/sistema_create_model.dart';
import 'package:publish_automatizado_app/app/model/sistema_model.dart';
import 'package:publish_automatizado_app/app/repositories/sistema_cn_repository.dart';
import 'package:publish_automatizado_app/app/repositories/sistema_repository.dart';
import 'package:publish_automatizado_app/app/store/sistema_cn_model_store.dart';
import 'package:publish_automatizado_app/app/store/sistema_model_store.dart';
import 'package:publish_automatizado_app/app/utils/constants.dart';

part 'sistema_store.g.dart';

class SistemaStore = _SistemaStoreBase with _$SistemaStore;

abstract class _SistemaStoreBase with Store {
  @observable
  ObservableList<SistemaModelStore>? sistemas;

  @observable
  ObservableList<SistemaCNModelStore>? sistemaCNs, dependencias;

  ObservableList<SistemaCNModelStore>? listaDefault;

  @observable
  SistemaModelStore sistemaModelStore;

  TextEditingController? nomeController, caminhoController;

  @observable
  bool _loading = true;

  final SistemaRepository _sistemaRepository;
  final SistemaCNRepository _sistemaCNRepository;

  _SistemaStoreBase(
    this.sistemaModelStore,
    this._sistemaRepository,
    this._sistemaCNRepository,
  ) {
    nomeController = TextEditingController();
    caminhoController = TextEditingController();
    sistemas = ObservableList<SistemaModelStore>();
    sistemaCNs = ObservableList<SistemaCNModelStore>();
    dependencias = ObservableList<SistemaCNModelStore>();

    fetchAll();
  }

  @action
  selecionarSistema(SistemaModelStore value) {
    dependencias = ObservableList<SistemaCNModelStore>();
    sistemaCNs = ObservableList<SistemaCNModelStore>();
    sistemaCNs!.addAll(listaDefault!);

    sistemaModelStore.model = sistemaModelStore.model.copyWith(
      idCodigo: value.model.idCodigo,
      nomeSistema: value.model.nomeSistema,
      caminhoSistema: value.model.caminhoSistema,
      dependencia: value.model.dependencia,
    );

    if (sistemaModelStore.model.dependencia!.sistemaCns != null &&
        sistemaModelStore.model.dependencia!.sistemaCns!.length > 0) {
      sistemaModelStore.model.dependencia!.sistemaCns!.forEach((element) {
        SistemaCNModelStore cnModelStore = SistemaCNModelStore(element);
        dependencias!.add(cnModelStore);
      });

      sistemaCNs!.removeWhere(
        (r) => dependencias!.any(
          (dp) => dp.model.idCodigo == r.model.idCodigo,
        ),
      );
    }

    nomeController!.text = sistemaModelStore.model.nomeSistema!;
    caminhoController!.text = sistemaModelStore.model.caminhoSistema!;
  }

  @action
  addItemSistema(int index) {
    SistemaCNModelStore modelStore = dependencias![index];
    sistemaCNs!.add(modelStore);

    dependencias!.removeWhere(
      (r) => sistemaCNs!.any(
        (dp) => dp.model.idCodigo == r.model.idCodigo,
      ),
    );
  }

  @action
  addItemDependencia(int index) {
    SistemaCNModelStore modelStore = sistemaCNs![index];
    dependencias!.add(modelStore);

    sistemaCNs!.removeWhere(
      (r) => dependencias!.any(
        (dp) => dp.model.idCodigo == r.model.idCodigo,
      ),
    );
  }

  @action
  changeIndexDependencia(oldIndex, newIndex) {
    if (oldIndex < newIndex) {
      newIndex -= 1;
    }

    dependencias!.insert(newIndex, dependencias!.removeAt(oldIndex));
  }

  fetchAll() async {
    try {
      await fetchSistemas();
      await fetchSistemaCNs();

      _loading = false;
    } catch (e) {
      _loading = false;
    }
  }

  fetchSistemas() async {
    sistemas = ObservableList<SistemaModelStore>();
    List<SistemaModel> modelos = await _sistemaRepository.fetchAll();

    if (modelos.length > 0) {
      modelos.forEach((e) {
        sistemas!.add(SistemaModelStore(e));
      });
    }
  }

  fetchSistemaCNs() async {
    sistemaCNs = ObservableList<SistemaCNModelStore>();
    listaDefault = ObservableList<SistemaCNModelStore>();

    List<SistemaCNModel> modelos = await _sistemaCNRepository.fetchAll();

    if (modelos.length > 0) {
      modelos.forEach((e) {
        sistemaCNs!.add(SistemaCNModelStore(e));
      });
    }

    listaDefault!.addAll(sistemaCNs!);
  }

  home() => Modular.to.pushReplacementNamed(kPHome);

  @action
  Future<MessageModel> save() async {
    MessageModel messageModel;

    SistemaCreateModel model = new SistemaCreateModel();
    model.idCodigo = sistemaModelStore.model.idCodigo;
    model.nomeSistema = sistemaModelStore.model.nomeSistema;
    model.caminhoSistema = sistemaModelStore.model.caminhoSistema;

    if (dependencias!.length > 0) {
      dependencias!.asMap().values.forEach((element) {
        model.dependencias!.add(element.model.idCodigo!);
      });
    }

    if (model.idCodigo == 0) {
      messageModel = await _sistemaRepository.insert(model);
    } else {
      messageModel = await _sistemaRepository.update(model);
    }

    return messageModel;
  }

  @computed
  bool get loading => _loading;
}
