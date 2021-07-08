import 'package:mobx/mobx.dart';
import 'package:publish_automatizado/app/model/sistema_model.dart';

part 'sistema_model_store.g.dart';

class SistemaModelStore = _SistemaModelStoreBase with _$SistemaModelStore;

abstract class _SistemaModelStoreBase with Store {
  @observable
  SistemaModel model;

  @observable
  bool _checked = false;

  _SistemaModelStoreBase(this.model);

  @action
  changeCheckBox(bool? value) {
    _checked = value ?? false;
  }

  @action
  changeNomeSistema(value) {
    model = model.copyWith(nomeSistema: value);
  }

  @action
  changeCaminhoSistema(value) {
    model = model.copyWith(caminhoSistema: value);
  }

  @computed
  get isChecked => _checked;
}
