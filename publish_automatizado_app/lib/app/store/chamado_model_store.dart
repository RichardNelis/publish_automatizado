import 'package:mobx/mobx.dart';
import 'package:publish_automatizado_app/app/model/chamado_model.dart';

part 'chamado_model_store.g.dart';

class ChamadoModelStore = _ChamadoModelStoreBase with _$ChamadoModelStore;

abstract class _ChamadoModelStoreBase with Store {
  @observable
  ChamadoModel model;

  _ChamadoModelStoreBase(this.model);

  @action
  changeNumeroChamado(value) => model = model.copyWith(numeroChamado: value);

  @action
  changeResponsavel(value) => model = model.copyWith(responsavel: value);

  @action
  changeMunicipio(value) => model = model.copyWith(municipio: value);
}
