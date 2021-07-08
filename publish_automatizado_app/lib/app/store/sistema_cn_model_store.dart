import 'package:mobx/mobx.dart';
import 'package:publish_automatizado/app/model/sistema_cn_model.dart';

part 'sistema_cn_model_store.g.dart';

class SistemaCNModelStore = _SistemaCNModelStoreBase with _$SistemaCNModelStore;

abstract class _SistemaCNModelStoreBase with Store {
  @observable
  SistemaCNModel model;

  _SistemaCNModelStoreBase(this.model);

  @action
  changeNomeSistema(value) {
    model = model.copyWith(nomeSistema: value);
  }

  @action
  changeCaminhoSistema(value) {
    model = model.copyWith(caminhoSistemaCN: value);
  }
}
